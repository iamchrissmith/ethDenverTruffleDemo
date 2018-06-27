pragma solidity ^0.4.17;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract DenverToken is StandardToken, Ownable {
  string public name = "DenverToken";
  string public symbol = "DT";
  uint8 public decimals = 2;
  uint public INITIAL_SUPPLY = 20000;

  function DenverToken() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }

  function changeName(string _name) 
    public 
    onlyOwner 
    returns (bool success)
  {
    name = _name;
    return true;
  }
}

// Truffle compile
// Truffle migrate
// truffle console
// let instance = null
// DenverToken.deployed().then(_instance => instance = _instance)
// instance.totalSupply.call().then(result => result.toString())
// instance.balanceOf.call('0x627306090abab3a6e1400e9345bc60c78a8bef57').then(result => result.toString())
// instance.transfer('0xf17f52151EbEF6C7334FAD080c5704D77216b732', 1234).then(result => console.log(result.logs[0].args))
// instance.balanceOf.call('0xf17f52151EbEF6C7334FAD080c5704D77216b732').then(result => result.toString())
// instance.balanceOf.call('0x627306090abab3a6e1400e9345bc60c78a8bef57').then(result => result.toString())
// Add zeppelin Ownable.sol
// migrate --reset
// DenverToken.deployed().then(_instance => instance = _instance)
// instance.owner.call().then(result => result.toString())
// We want the owner to be able to change the token's name
// .exit
