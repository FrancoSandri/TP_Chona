// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
 
contract Estudiante{
    //variables
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    string[] private _materias;
    mapping(string => uint) private notas_materias;
 
    //constructor
   
    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }
    //funcion get apellido
    function apellido() public view returns(string memory){
        return _apellido;
    }
 
    //funcion get nombre completo
    function nombre_completo() public view returns(string memory, string memory){
        return (_nombre, _apellido);
    }
 
    //funcion get curso
    function curso() public view returns (string memory){
        return _curso;
    }
    //funcion set nota de materia
    function set_nota_materia(uint nota_, string memory materia) public{
        require(_docente == msg.sender, "Solo el docente puede asignar notas");
        require(nota_ <= 100 && nota_ >=1);
        notas_materias[materia] = nota_;
        _materias.push(materia);
    }
 
    //funcion get nota materia
    function nota_materia(string memory materia) public view returns(uint){
        return notas_materias[materia];
    }
 
    //funcion get aprobacion
    function aprobo (string memory materia) public view returns(bool){
        require(notas_materias[materia]>=60);
        return true;
    }
 
    function promedio() public view returns(uint){
        uint promedio_;
        uint largoArray = _materias.length;
        uint nota_promedio;
        for (uint i = 0; i < largoArray; i++){
           nota_promedio += notas_materias[_materias[i]];
        }
 
        promedio_ = nota_promedio / largoArray;  
        return promedio_;
    }
}