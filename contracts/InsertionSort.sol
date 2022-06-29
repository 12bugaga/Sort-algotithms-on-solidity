// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract InsertionSort {
  function sort(uint[] memory items) public view returns(uint[] memory){
    uint sortedRangeEndIndex = 1;
    uint insertIndex;
    while(sortedRangeEndIndex < items.length){
      if(items[sortedRangeEndIndex] < items[sortedRangeEndIndex - 1]){
        insertIndex = findInsertionIndex(items, items[sortedRangeEndIndex]);
        insert(items, insertIndex, sortedRangeEndIndex);
      }
      sortedRangeEndIndex++;
    }
    return items;
  }

  function findInsertionIndex(uint[] memory items, uint valueToInsert) pure private returns(uint i) {
    for(i = 0; i < items.length; i++){
      if(items[i] > valueToInsert){
        return i;
      }
    }
    require(true, "Index not found!");
  }

  function insert(uint[] memory items, uint indexInsertingAt, uint indexInsertingFrom) pure private{
    uint temp = items[indexInsertingAt];
    items[indexInsertingAt] = items[indexInsertingFrom];
    for(uint current = indexInsertingFrom; current > indexInsertingAt; current--)
      items[current] = items[current -1];
    items[indexInsertingAt + 1] = temp;
  }
}
