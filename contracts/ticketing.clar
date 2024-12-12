;; CodeEntry NFT Ticketing Smart Contract
;; SPDX-License-Identifier: MIT

(define-non-fungible-token codeentry-ticket (string-ascii 100))

;; Constants
(define-constant CONTRACT-OWNER tx-sender)
(define-constant ERR-NOT-OWNER (err u100))
(define-constant ERR-TICKET-ALREADY-MINTED (err u101))
(define-constant ERR-TICKET-NOT-FOUND (err u102))
(define-constant ERR-UNAUTHORIZED-TRANSFER (err u103))

;; Storage
(define-map ticket-metadata 
  {ticket-id: (string-ascii 100)} 
  {
    event-name: (string-ascii 100),
    event-date: (string-ascii 50),
    ticket-price: uint,
    max-capacity: uint,
    current-sales: uint
  }
)

;; Read-only functions
(define-read-only (get-ticket-owner (ticket-id (string-ascii 100)))
  (nft-get-owner? codeentry-ticket ticket-id)
)

(define-read-only (get-ticket-metadata (ticket-id (string-ascii 100)))
  (map-get? ticket-metadata {ticket-id: ticket-id})
)

;; Mint new event ticket
(define-public (mint-ticket 
  (ticket-id (string-ascii 100))
  (event-name (string-ascii 100))
  (event-date (string-ascii 50))
  (ticket-price uint)
  (max-capacity uint)
)
  (begin
    ;; Ensure ticket hasn't been minted before
    (asserts! (is-none (get-ticket-metadata ticket-id)) ERR-TICKET-ALREADY-MINTED)
    
    ;; Create ticket metadata
    (map-set ticket-metadata 
      {ticket-id: ticket-id}
      {
        event-name: event-name,
        event-date: event-date,
        ticket-price: ticket-price,
        max-capacity: max-capacity,
        current-sales: u0
      }
    )
    
    ;; Mint NFT to contract owner
    (nft-mint? codeentry-ticket ticket-id CONTRACT-OWNER)
  )
)

;; Purchase ticket
(define-public (purchase-ticket (ticket-id (string-ascii 100)))
  (let ((ticket-info (unwrap! (get-ticket-metadata ticket-id) ERR-TICKET-NOT-FOUND)))
    (begin
      ;; Check if ticket sales haven't exceeded max capacity
      (asserts! 
        (< (get current-sales ticket-info) (get max-capacity ticket-info)) 
        (err u104)
      )
      
      ;; Transfer ticket price (simplified - would integrate with STX transfer)
      (try! (stx-transfer? (get ticket-price ticket-info) tx-sender CONTRACT-OWNER))
      
      ;; Update ticket sales
      (map-set ticket-metadata 
        {ticket-id: ticket-id}
        (merge ticket-info {current-sales: (+ (get current-sales ticket-info) u1)})
      )
      
      ;; Mint ticket NFT to purchaser
      (nft-mint? codeentry-ticket ticket-id tx-sender)
    )
  )
)

;; Transfer ticket
(define-public (transfer-ticket 
  (ticket-id (string-ascii 100)) 
  (new-owner principal)
)
  (begin
    ;; Ensure only current ticket owner can transfer
    (asserts! 
      (is-eq tx-sender (unwrap! (nft-get-owner? codeentry-ticket ticket-id) ERR-TICKET-NOT-FOUND)) 
      ERR-UNAUTHORIZED-TRANSFER
    )
    
    ;; Transfer NFT
    (nft-transfer? codeentry-ticket ticket-id tx-sender new-owner)
  )
)