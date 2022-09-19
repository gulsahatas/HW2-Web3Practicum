pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract ToDoList {
    struct ToDo {   //ToDo struct keeps the name of the task as "text" and the complete status as "isComplete" (true if complete, false if not)
        string text;
        bool isComplete;
    }
    ToDo [] public ToDos;   //array of ToDo structs
    
    function create(string calldata _text) external{    //initialize ToDo struct
        ToDos.push(
            ToDo({
                text: _text,
                isComplete: false
            })
        );
    }

    function get (uint i) public view returns (string memory text, bool isComplete) {   //overwrite the automatically created getter
        ToDo storage todo = ToDos[i];     // arbitrary todo struct to get the ith element of the array of structures
        return (todo.text, todo.isComplete);
    }

    function updateText (uint i, string calldata _text) external {      //change the ith element of the array of structures to the parameter _text
        ToDo storage todo = ToDos[i];
        todo.text = _text;
    }
    
    function changeCompletedStatus (uint i) external {    // change the completed status to false if it was true, and true if it was false
        ToDo storage todo = ToDos[i];
        todo.isComplete = !todo.isComplete;
    }

}
