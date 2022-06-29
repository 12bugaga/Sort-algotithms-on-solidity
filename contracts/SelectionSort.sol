// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Base.sol";

contract SelectionSort is Base {
  function sort(uint[] memory items) public view returns(uint[] memory){
    uint sortedRangeEnd = 0;
    uint nextIndex;
    while(sortedRangeEnd < items.length){
      nextIndex = findIndexOfSmallestFromIndex(items, sortedRangeEnd);
      swap(items, sortedRangeEnd, nextIndex);
      sortedRangeEnd++;
    }
    return items;
  }

  function findIndexOfSmallestFromIndex(uint[] memory items, uint sortedRangeEnd) private pure returns(uint currentSmallestIndex){
    uint currentSmallest = items[sortedRangeEnd];
    currentSmallestIndex = sortedRangeEnd;

    for(uint i = sortedRangeEnd + 1; i < items.length; i++){
      if(currentSmallest > items[i]){
        currentSmallest = items[i];
        currentSmallestIndex = i;
      }
    }
  }
}
