// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract QuickSort {
  
  function sort(uint[] memory items) public view returns(uint[] memory){
    quickSortMain(items, 0, items.length - 1);
    return items;
  }

  function quickSortMain(uint[] memory items, uint left, uint right) private pure{
    uint temp;

    uint i = left;
    uint j = right;
    uint pivot = items[(left + right) / 2];
  
    while(i <= j){
      while(items[i] < pivot)
        i++;
      
      while(items[j] > pivot)
        if(j != 0)
          j--;

      if(i <= j){
        temp = items[i];
        items[i] = items[j];
        items[j] = temp;
        
        i++;
        if(j != 0)
          j--;
      }
    }

    if(left < j)
      quickSortMain(items, left, j);
    if(i < right)
      quickSortMain(items, i, right);
  }
}
