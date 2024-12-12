# CodeEntry: Decentralized Event Ticketing Platform

## Overview

CodeEntry is a blockchain-powered event ticketing platform built on the Stacks blockchain using Clarity smart contracts. The platform provides a secure, transparent, and flexible solution for event ticket management through non-fungible tokens (NFTs).

## Key Features

- **Unique NFT Tickets**: Each event ticket is minted as a distinct, verifiable non-fungible token
- **Fraud Prevention**: Blockchain-based verification ensures ticket authenticity
- **Flexible Ticket Management**:
  - Easy ticket transfers between users
  - Transparent sales tracking
  - Event cancellation and refund mechanisms
- **Immutable Event Metadata**: Secure and unchangeable ticket information

## Smart Contract Functions

### Event Creation and Management
- `mint-ticket`: Create new event tickets with comprehensive metadata
  - Set event name, date, price, and maximum capacity
  - Initial ticket minted to contract owner
- `update-event-details`: Modify event details before ticket sales begin
  - Change event name, date, and ticket price
  - Restricted to contract owner
  - Prevents updates after tickets are sold

### Ticket Purchasing and Transfer
- `purchase-ticket`: User-friendly ticket acquisition
  - Verify ticket availability
  - Check event capacity
  - Transfer ticket price to event organizer
  - Mint ticket NFT to purchaser
- `transfer-ticket`: Seamless ticket ownership transfer
  - Ensure transfers only by current ticket owners
  - Preserve ticket metadata integrity

### Event Control
- `cancel-event`: Provide flexibility for event organizers
  - Cancel events before or after ticket sales
  - Enable refund mechanisms
- `refund-ticket`: User protection for cancelled events
  - Burn ticket NFT
  - Refund ticket price to original purchaser

## Technical Specifications

- **Blockchain**: Stacks
- **Smart Contract Language**: Clarity
- **Token Standard**: Non-Fungible Token (NFT)
- **Supported Ticket Metadata**:
  - Unique Ticket ID
  - Event Name
  - Event Date
  - Ticket Price
  - Maximum Capacity
  - Current Sales Tracking

## Security Measures

- Robust input validation
- Prevent duplicate ticket minting
- Restrict ticket transfers to current owners
- Transparent and immutable sales tracking
- Event cancellation and refund protections

## Installation and Deployment

### Prerequisites
- Stacks Wallet
- Hiro Web Wallet
- Basic understanding of Clarity smart contracts

### Deployment Steps
1. Clone the project repository
2. Review and test smart contract on Stacks testnet
3. Deploy contract to Stacks mainnet
4. Integrate with frontend application
5. Configure wallet connections

## Roadmap and Future Enhancements

- Implement dynamic ticket pricing
- Develop ticket resale marketplace
- Add event check-in verification
- Support multi-event ticket management
- Enhance refund and transfer mechanisms

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Submit a pull request

Please adhere to our coding standards and include appropriate tests for new features.

