// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//Unused local variableRemove array element by shifting elements from right to left
//未使用的局部变量通过从右向左移动元素来移除数组元素

contract ArrayRemoveByShifting {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []
    uint256[] public arr;
    function remove(uint256 _index) public {
        require(_index < arr.length,"index out of bound");
        for(uint256 i = _index; i< arr.length; i++) {
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1,2,3,4,5];
        remove(2);
        // [1, 2, 4, 5]
        assert(arr[0] == 1); //使用assert语句来确保数组的第一个元素是1。如果这个条件不满足，当前的调用将失败，并回滚所有状态变化。
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);
        arr = [1];
        remove(0); // []
        assert(arr.length == 0);
    }
}

//通过将最后一个元素复制到要删除的位置来删除数组元素   Remove array element by copying last element into to the place to remove
contract ArrayReplaceFromEnd{
    uint256[] public arr;
    // Deleting an element creates a gap in the array.      删除元素会在阵列中创建一个间隙
    // One trick to keep the array compact is to            保持阵列紧凑的一个技巧是
    // move the last element into the place to delete.      将最后一个元素移动到要删除的位置
    function remove(uint256 index) public{
        // Move the last element into the place to delete   将最后一个元素移动到要删除的位置
        arr[index] = arr[arr.length - 1];
        // Remove the last element                          删除最后一个元素
        arr.pop();
    }
    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}
