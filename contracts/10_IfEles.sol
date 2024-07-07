// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// Solidity supports conditional statements if, else if and else.    solidity支持if else if 和 else
contract IfElse {
    function foo(uint256 x) public pure returns (uint256){
        if(x < 10){
            return 0;
        }else if(x < 20){
            return 1;
        }else{
            return 2;
        }
    }

    //简写if else   使用三元运算
    function ternary(uint256 _x) public pure returns(uint256){
        return _x < 10 ? 1 : 2;
    }
}