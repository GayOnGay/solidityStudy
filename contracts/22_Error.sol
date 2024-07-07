// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// An error will undo all changes made to the state during a transaction.
// 一个错误将撤消在事务处理过程中对状态所做的所有更改
// You can throw an error by calling require, revert or assert.
// 您可以通过调用require、revert或assert来引发错误
// require is used to validate inputs and conditions before execution.
// require用于在执行之前验证输入和条件
// revert is similar to require. See the code below for details.
// revert类似于require。有关详细信息，请参阅下面的代码
// assert is used to check for code that should never be false. Failing assertion probably means that there is a bug.
// assert用于检查不应该为false的代码。断言失败可能意味着存在错误

contract Error {
    function testRequire(uint256 _i) public pure {
        // Require should be used to validate conditions such as:       Require应用于验证以下条件：
        // - inputs                                                     输入
        // - conditions before execution                                执行前的条件
        // - return values from calls to other functions                从对其他函数的调用中返回值
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint256 _i) public pure {
        // Revert is useful when the condition to check is complex.     当要检查的条件很复杂时，还原很有用
        // This code does the exact same thing as the example above     此代码执行与上面的示例完全相同的操作
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;
    function testAssert() public view {
        // Assert should only be used to test for internal errors,      Assert应仅用于测试内部错误
        // and to check invariants.                                     以及检查不变量
        // Here we assert that num is always equal to 0                 这里我们断言num总是等于0
        // since it is impossible to update the value of num            因为无法更新num的值
        assert(num == 0);
    }

    // custom error                                                     自定义错误
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
}

// another example
contract Account {
    uint256 public balance;
    uint256 public constant MAX_UINT = 2 ** 256 - 1;

    function deposit(uint256 _amount) public {
        uint256 oldBalance = balance;
        uint256 newBalance = balance + _amount;

        // balance + _amount does not overflow if balance + _amount >= balance
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint256 _amount) public {
        uint256 oldBalance = balance;

        // balance - _amount does not underflow if balance >= _amount
        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}