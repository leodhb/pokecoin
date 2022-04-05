# PokéCoin
Exchange to trade pokémon as NFTs

## Project Specifications
#### HTTP Routes:
| **VERB** | **Route**             | **Description**                         |
|----------|-----------------------|-----------------------------------------|
| [GET]    | /                     | Landing Page                            |
| [GET]    | /pokemon              | List All Pokemon                        |
| [GET]    | /pokemon/:id          | Shows a Pokemon                         |
| [GET]    | /pokemon/:id/checkout | Proceed to buy a Pokemon                |
| [POST]   | /pokemon/:id/buy      | Validates and transact a valid purchase |
| [POST]   | /pokemon/:id/sell     | Validates and transact a valid sale     |
| [GET]    | /me                   | Displays the logged in user account     |
| [GET]    | /me/add               | Shows a screen to add money to wallet   |
| [PATCH]  | /me/add               | Adds money to the wallet                |
| [GET]    | /me/transactions      | Shows all user transactions             |

#### Registering a Buy (from the exchange):
 - Check if user has enough USD_BTC to buy
 - Decrement from user balance
 - Change the pokemon owner
 - Change the last_sell_price
 - Register a transaction with a BUY operation

#### Registering a Sell (to the exchange):
 - Check if user really own that Pokemon
 - Change the pokemon owner
 - Change the last_sell_price
 - Add to from user balance
 - Register a transaction with a SELL operation

## ERD Diagram
![QuickDBD-Free Diagram](https://user-images.githubusercontent.com/24739860/161654566-2c97b19f-7f3f-440d-b1e5-1409e13ae29b.png)
