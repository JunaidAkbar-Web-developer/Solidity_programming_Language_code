// SPDX-License-Identifier: MIT
// License identifier for the smart contract.
pragma solidity >=0.8.0 <0.9.0;
// Solidity compiler version and This contract will compile with versions 0.8.0 up to (but not including) 0.9.0..

contract Student_marks_Management_System {
    // Contract declaration and This contract manages student marks and stores student records.

    // STRUCT
    struct Student_details {
        // It groups multiple related variables into one object and This contract manages student marks and stores student records.

        string name; // Stores the student's name.

        string roll_no; // Stores the student's roll number.

        uint256[] marks; // Dynamic array that stores all subject marks.

        uint256 total_marks; // Stores the sum of all subject marks.

        uint256 Percentage; // Stores the average marks (named Percentage here).
    }

    // MAPPING

    mapping(string => Student_details) private Student_Information;

    /* mapping(KeyType => ValueType) */

    // private means only this contract can access the mapping directly.

    // FUNCTION
    function Assigned_value_students(

        // Function name and  Used to add or update a student's information.

        string memory _name, // Student name received from the user.

        string memory _rollno, // Student roll number.

        uint256[] memory _marks
        // Dynamic array containing subject marks. 
        // memory means temporary storage during function execution.

    ) public { // public means anyone can call this function.

        uint256 _total_marks = 0;

        // Variable to store total marks. Initially set to zero.

        for (uint256 i = 0; i < _marks.length; i++) {
/* for Loop ( Initialization: i = 0;  Condition:i < _marks.length;  Increment: i++ Loop runs until every mark is added.) */

            _total_marks += _marks[i]; //_total_marks = _total_marks + _marks[i];
        }

        // Average Calculation
        uint256 Average = _marks.length > 0 ? _total_marks / _marks.length : 0;

        // Ternary Operator Condition ?  True Value :

        // Store Student Record
        Student_Information[_rollno] = Student_details({
            //Creates a Student_details object and stores it in the mapping using roll number as the key.

            name: _name, // Save student name.

            roll_no: _rollno, // Save roll number.

            marks: _marks, // Save all subject marks.

            total_marks: _total_marks, // Save calculated total marks.

            Percentage: Average // Save calculated average.
        });

    }

    // VIEW FUNCTION

    function Fetch_Student_details(string memory _rollno  /* Roll number entered by the user.*/)
        /* Public means : Any one access.
           view means : only read code and not change code.
           returns means: Declares what type of data the function will give back.
        */
        public view returns (
            string memory name, // Returns student name.

            string memory roll_no, // Returns roll number.

            uint256[] memory marks,// Returns marks array.

            uint256 total_marks, // Returns total marks.

            uint256 Percentage // Returns average.
        )
    {

        Student_details memory get_value_students =
            Student_Information[_rollno];

        /*
        Reads the student's record from the mapping.

        Mapping Lookup --> Roll Number --> Student Record */

        return (

            get_value_students.name, // Return name.

            get_value_students.roll_no, // Return roll number.

            get_value_students.marks, // Return marks array.

            get_value_students.total_marks, // Return total marks.

            get_value_students.Percentage // Return average.
        );

    }
}
