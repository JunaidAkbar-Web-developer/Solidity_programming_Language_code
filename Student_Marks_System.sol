// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
contract Students_information {
    struct Student_detail_property {
        string name; string roll_no; uint256 English; uint256 Math;
        uint256 Computer; uint256 Science; uint256 G_K; uint256 total_marks; uint256 percentage;
    }

    mapping(string => Student_detail_property) public Student_get_details;

    function Assigned_value_students(
        string memory _rollno,string memory _name,uint _English,uint _Mathe,uint _Computer,uint _Science,uint _G_K
    ) public {
        uint total_marks = _English + _Mathe + _Computer + _Science + _G_K;
        uint percentage = total_marks / 5;

        Student_get_details[_rollno] = Student_detail_property(
            _rollno,_name,_English, _Mathe, _Computer, _Science,_G_K,total_marks,percentage
        );}

    function Get_students_details(string memory _rollno ) public view returns (
            string memory name,string memory roll_no,uint256 English,
            uint256 Math,uint256 Computer,uint256 Science,uint256 G_K,
            uint256 total_marks,uint256 percentage
        ){
        Student_detail_property memory new_set_details = Student_get_details[_rollno];
        return (
            new_set_details.name , new_set_details.roll_no,new_set_details.English,
            new_set_details.Math,new_set_details.Computer,new_set_details.Science,
            new_set_details.G_K,new_set_details.total_marks,new_set_details.percentage
        );
    }
}
