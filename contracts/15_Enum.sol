// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// Solidity supports enumerables and they are useful to model choice and keep track of state.
//Solidity支持枚举，它们对模型选择和跟踪状态很有用
// Enums can be declared outside of a contract.                         枚举可以在合约之外声明

contract Enum {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    // Default value is the first element listed in             默认值是list中的第一个元素
    // definition of the type, in this case "Pending"           类型的定义，在本例中为“Pending”
    Status public status;
    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input                 通过将uint传递到输入中来更新状态
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this              可以更新到这样的特定枚举
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0             delete将枚举重置为其第一个值0
    function reset() public {
        delete status;
    }
}