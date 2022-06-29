// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Base {
  function swap(uint[] memory items, uint left, uint right) public pure{
    if(left != right){
      uint temp = items[right];
      items[right] = items[left];
      items[left] = temp;
    }
  }

  function getTestValue() public view returns(uint[] memory){
    return array;
  }

  uint testValue = 666;
  uint[] array = [1,3,5];
}
