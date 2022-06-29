// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Base.sol";

contract Bubble is Base{
  function sort(uint[] memory items) public view returns(uint[] memory){
    bool swapped;

    do{
      swapped = false;
      for(uint i = 1; i < items.length; i++){
        if(items[i - 1] > items[i]){
          swap(items, i-1, i);
          swapped = true;
        }
      }
    }
    while(swapped != false);

    return items;
  }
}
