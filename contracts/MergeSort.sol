// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MergeSort {

  function sort(uint[] memory items) public view returns(uint[] memory){
    mergeSortPrivate(items);
    return items;
  }

  function mergeSortPrivate(uint[] memory items) pure private{
    if(items.length <= 1) return;

    uint leftSize = items.length / 2;
    uint rightSize = items.length - leftSize;
    uint[] memory left = new uint[](leftSize);
    uint[] memory right = new uint[](rightSize);

    arrayCopy(items, 0, left, 0, leftSize);
    arrayCopy(items, leftSize, right, 0, rightSize);

    mergeSortPrivate(left);
    mergeSortPrivate(right);

    merge(items, left, right);
  }

  function merge(uint[] memory items, uint[] memory left, 
   uint[] memory right) pure private{
    uint leftIndex;
    uint rightIndex;
    uint targetIndex;
    uint remaining = left.length + right.length;

    while(remaining > 0){
      if(leftIndex >= left.length)
        items[targetIndex] = right[rightIndex++];
      else if(rightIndex >= right.length)
        items[targetIndex] = left[leftIndex++];
      else if(left[leftIndex] < right[rightIndex])
        items[targetIndex] = left[leftIndex++];
      else  
        items[targetIndex] = right[rightIndex++];

      remaining--;
      targetIndex++;
    }
  }

  function arrayCopy(uint[] memory fromArray, uint fromIndex, 
  uint[] memory toArray, uint toIndex, uint amount) private pure{
    for(uint i = 0; i < amount; i++){
      toArray[toIndex + i] = fromArray[fromIndex + i];
    }
  }
}
