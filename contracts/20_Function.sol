// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// There are several ways to return outputs from a function.
// 有几种方法可以返回函数的输出
// Public functions cannot accept certain data types as inputs or outputs
// 公共函数不能接受某些数据类型作为输入或输出

contract Function{
    // Functions can return multiple values.    函数可以返回多个值
    function returnMany() public pure returns (uint256, bool, uint256) {
        return (1, true, 2);
    }

    // Return values can be named.              可以命名返回值
    function named() public pure returns (uint256 x, bool b, uint256 y) {
        return (1, true, 2);
    }

    // Return values can be assigned to their name.             返回值可以指定给它们的名称
    // In this case the return statement can be omitted.        在这种情况下，可以省略return语句
    function assigned() public pure returns (uint256 x, bool b, uint256 y) {
        x = 1;
        b = true;
        y = 2;
    }

    // Use destructuring assignment when calling another        调用另一个时使用析构函数赋值
    // function that returns multiple values.                   函数返回多个值
    function destructuringAssignments() public pure returns (uint256, bool, uint256, uint256, uint256) {
        (uint256 i, bool b, uint256 j) = returnMany();
        // Values can be left out.                              值可以省略
        (uint256 x,, uint256 y) = (4, 5, 6);                    //是x,,y 中间有个空值
        return (i, b, j, x, y);
    }

    // Cannot use map for either input or output                不能将映射用于输入或输出
    // Can use array for input                                  可以使用数组进行输入
    function arrayInput(uint256[] memory _arr) public {}

    // Can use array for output                                 可以使用数组进行输出
    uint256[] public arr;
    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }
}

// Call function with key-value inputs                          具有键值输入的调用函数
contract XYZ {
    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint256) {}

    function callFunc() external pure returns (uint256) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint256) {
        return someFuncWithManyInputs({
            a: address(0),
            b: true,
            c: "c",
            x: 1,
            y: 2,
            z: 3
        });
    }
}