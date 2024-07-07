// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// Solidity supports for, while, and do while loops.
// Solidity支持循环、while和do-while。
// Don't write loops that are unbounded as this can hit the gas limit, causing your transaction to fail.
// 不要编写无限制的循环，因为这可能会达到气体限制，导致事务失败。
// For the reason above, while and do while loops are rarely used
// 由于上述原因，很少使用while和do-while循环

contract Loop {
    function loop() public{
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue   跳到下一次迭代并继续
                continue;
            }
            if (i == 5) {
                // Exit loop with break   退出循环
                break;
            }

            // while loop
            uint256 j;
            while (j < 10) {
                j++;
            }
        }
    }
}