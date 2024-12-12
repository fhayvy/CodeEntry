# CodeEntry: NFT-Based Event Ticketing Platform

## Overview
CodeEntry is a decentralized event ticketing platform built on the Stacks blockchain, leveraging Clarity smart contracts to provide secure, transparent, and transferable event tickets.

## Features
- Mint unique event tickets as NFTs
- Prevent ticket fraud through blockchain verification
- Enable easy ticket transfers
- Track ticket sales and event capacity
- Transparent and immutable ticket metadata

## Smart Contract Functions

### `mint-ticket`
- Create a new event ticket with metadata
- Set event name, date, price, and maximum capacity
- Mints initial ticket to contract owner

### `purchase-ticket`
- Allow users to purchase tickets
- Verify ticket availability
- Transfer ticket price to event organizer
- Mint ticket NFT to purchaser

### `transfer-ticket`
- Enable ticket owners to transfer tickets to other users
- Ensure only current ticket owner can transfer
- Preserve ticket metadata during transfer

## Technical Details
- Blockchain: Stacks
- Smart Contract Language: Clarity
- Token Standard: Non-Fungible Token (NFT)

## Installation

### Prerequisites
- Stacks Wallet
- Hiro Web Wallet
- Basic understanding of Clarity smart contracts

### Deployment
1. Clone the repository
2. Deploy smart contract to Stacks testnet/mainnet
3. Integrate with frontend application

## Security
- Built-in checks to prevent duplicate ticket minting
- Ticket transfer restricted to current owners
- Transparent sales tracking
- Immutable event metadata

## Future Roadmap
- Add more advanced ticketing features
- Implement dynamic pricing
- Create marketplace for ticket resale
- Add event check-in verification

## Contributing
Contributions are welcome! Please read our contributing guidelines before submitting pull requests.

