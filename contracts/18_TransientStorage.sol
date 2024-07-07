// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//Data stored in transient storage is cleared out after transaction.     存储在临时存储器中的数据在事务处理后被清除

// Make sure EVM version and VM set to Cancun                            确保EVM版本和VM设置为Cancun
// Storage - data is stored on the blockchain                            Storage-数据存储在区块链上
// Memory - data is cleared out after a function call                    Memory-函数调用后清除数据
// Transient storage - data is cleared out after a transaction           Transient storage-事务处理后清除数据

interface ITest {
    function val() external view returns (uint256);
    function test() external;
}

contract Callback {
    // 这个合约有一个公共变量val，回退函数fallback()，当合约通过未定义的函数名被调用时，会触发这个函数。
    // test函数调用传入地址的test函数。
    uint256 public val;

    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external {
        ITest(target).test();
    }
}

contract TestStorage {
    uint256 public val;

    function test() public {
        val = 123;
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    function test() public {
        assembly {
            tstore(SLOT, 321)
        }
        bytes memory b = "";
        msg.sender.call(b);
        // msg.sender.call(b); 这行代码调用了消息发送者的回退函数。
        // 这里msg.sender指的是调用test函数的外部账户或合约的地址，call是低级调用，它允许合约执行任意的外部调用，
        // 而b是一个空的字节数组，表示没有传递任何数据。
    }

    function val() public view returns (uint256 v) {
        assembly {
            v := tload(SLOT)
        }
    }
}

contract ReentrancyGuard {
    bool private locked;

    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    // 35313 gas
    function test() public lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient {
    bytes32 constant SLOT = 0;

    modifier lock() {
        assembly {
            if tload(SLOT) { revert(0, 0) }
            tstore(SLOT, 1)
        }
        _;
        assembly {
            tstore(SLOT, 0)
        }
    }

    // 21887 gas
    function test() external lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}