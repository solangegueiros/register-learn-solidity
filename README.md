## Learn solidity with the Register project

This is a set of smart contracts examples to learn Solidity fundamentals

Register-01.sol is a very basic smart contract.

Then will be created new versions, adding Solidity concepts in each of them.

I suggest to try it in [Remix](http://remix.ethereum.org/)

### Solidity concepts

#### Register-01
- Comments
- License-Identifier
- Solidity version: ```pragma``` command
- Creating a contract: ```contract``` command
- Variable type: ```string```
- Variable visibility: ```private```
- Creating a function: ```function```
- Function visibility: ```external```
- Function types: ```view```
- Function with parameters
- Returning data in functions

#### Register-02
- Variable type: ```uint```
- Variable visibility: ```public```
- Initializing a variable
- Increasing numbers

#### Register-03
- Initializing a contract: ```constructor``` command

#### Register-04
- Variable type: ```address```
- Owner concept
- Global variable: ```msg.sender```
- Checking conditions: ```if```command
- Permissions and access concepts

#### Register-05
- Managing conditions: ```require``` command
- Error messages

#### Register-06
- Function modifiers

#### Register-07
- Events

#### Register-08
- All together 1
  - types string, uint, address
  - msg.sender and owner, constructor
  - require, function modifiers, events

#### Register-09
- Array

#### Register-10
- Loop structures: ```for```
- Local / memory array

#### Register-11
- Key -> value concept: ```mapping``` command
- Access control: creating a whitelist using a ```mapping```

#### Register-12
- Enum concept

#### Register-13
- Structs

#### Register-14
- Combining ```mapping``` and ```struct```
- One struct per address
- You can only modify your own struct, no whitelist

#### Register-15
- Combining ```mapping``` and ```array```
- Each address has a mapping with array of structs
