// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// You can define your own type by creating a struct.
// 您可以通过创建结构来定义自己的类型
// They are useful for grouping together related data.
// 它们可用于将相关数据分组在一起
// Structs can be declared outside of a contract and imported in another contract.
// 结构可以在合同之外声明，也可以在另一个合同中导入

contract Todos {
    struct Todo{
        string text;
        bool completed;
    }
    // An array of 'Todo' structs  “Todo”结构的数组
    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 ways to initialize a struct        初始化结构的3种方法
        // - calling it like a function         像函数一样调用它
        todos.push(Todo(_text, false));

        // key value mapping                    键值映射
        todos.push(Todo({text: _text, completed: false}));

        //初始化一个空结构，然后更新它             initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false  todo.completed已初始化为false
        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so           Solidity自动为“todos”创建了一个getter，因此
    // you don't actually need this function.                           你实际上并不需要这个功能
    function get(uint256 index) public view returns(string memory text, bool completed){
        Todo storage todo = todos[index];
        return (todo.text, todo.completed);
    }

        // update text
    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}