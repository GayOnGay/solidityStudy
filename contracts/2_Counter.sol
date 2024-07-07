// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Counter {
    //声明变量 count
    uint256 public count;

    //获取当前count的函数
    function get() public view returns (uint256) {
        return count;
    }

    //让当前的count加一
    function countAddOne() public {
         count += 1;
    }

    //让当前的coount减一
    function countMinusOne() public {
        //如果count=0，此方法将失败
        count -= 1;
    }
}