// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// 一笔交易需要支付多少以太币？                            How much ether do you need to pay for a transaction?
// 你支付的gas费*gas价格的ether，其中                      You pay gas spent * gas price amount of ether, where
// gas是一个计算单位                                      gas is a unit of computation
// 花费的gas是交易中使用的gas总量                          gas spent is the total amount of gas used in a transaction
// gas价格是指你愿意为每种gas支付多少ether                 gas price is how much ether you are willing to pay per gas
// gas价格较高的交易具有更高的优先权，可以被包括在区块中。   Transactions with higher gas price have higher priority to be included in a block.
// 未使用的gas将被退还。                                  Unspent gas will be refunded.

contract Gas {
    uint256 public i = 0;
    //用完您发送的所有gas会导致您的交易失败。   Using up all of the gas that you send causes your transaction to fail.
    //状态更改被撤消。                        State changes are undone.
    //花费的gas不予退还。                     Gas spent are not refunded.

    function forever() public {
        //在这里，我们运行一个循环，直到所有的gas都用完   Here we run a loop until all of the gas are spent
        //并且交易失败                                  and the transaction fails
        while (true) {
            i+= 1;
        }
    }
}