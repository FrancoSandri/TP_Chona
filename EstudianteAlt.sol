// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
 
contract Estudiante{
    //Variables
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    address[] private _docentes_autorizados;
    string[] private _materias;
    mapping(string => mapping (uint => uint)) private notas_materias;
    uint[]private _bimestre;
    event set_nota_docente(address indexed docente, string materia, uint nota__);
 
    //Constructor
   
    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
        
    }
    //Funcion que devuelve el apellido del estudiante
    function apellido() public view returns(string memory){
        return _apellido;
    }
 
    //Funcion que devuelve el nombre completo del estudiante
    function nombre_completo() public view returns(string memory, string memory){
        return (_nombre, _apellido);
    }
 
    //Funcion que agrega el address de los docentes autorizados, chequeando que no este repetido
    function setDocente(address docente_address) public {
        require(checkDocente(docente_address) == false, "El docente no puede volver a ser autorizado");
        _docentes_autorizados.push(docente_address);
    }
    
    //Funcion que chequea que el address del docente este en los addresses autorizados 
    function checkDocente(address docente_address) public view returns (bool){
        uint largoArrayDocente = _docentes_autorizados.length;
        bool autorizado = false;

        for (uint i = 0; i < largoArrayDocente; i++){
            if (_docentes_autorizados[i] == docente_address){
                autorizado = true;
            }
        }

        return autorizado;
    }
 
    //Funcion que devuelve el curso del estudiante
    function curso() public view returns (string memory){
        return _curso;
    }
    //Funcion que permite al docente y a los docentes autorizados setear las notas de los estudiantes
    function set_nota_materia(uint nota_, string memory materia, uint bimestre_) public{
        require(_docente == msg.sender || checkDocente(msg.sender) == true, "Solo el docente puede asignar notas");
        require(nota_ <= 100 && nota_ >=1);
        require(bimestre_ > 0 && bimestre_ < 5);
        notas_materias[materia][bimestre_] = nota_;
        _materias.push(materia);
        _bimestre.push(bimestre_);
        emit set_nota_docente(msg.sender, materia, nota_);
    }
 
    //Funcion que devuelve la nota del estudiante
    function nota_materia(string memory materia, uint bimestre) public view returns(uint){
        return notas_materias[materia][bimestre];
    }
 
    //Funcion que devuelve si el estudiante aprobó o no una materia
    function aprobo (string memory materia, uint bimestre) public view returns(bool){
        require(notas_materias[materia][bimestre]>=60);
        return true;
    }

    //Funcion que devuelve el promedio del estudiante
    function promedio() public view returns(uint){
        uint promedio_;
        uint largoArray = _materias.length;
        uint nota_promedio;
        for (uint i = 0; i < largoArray; i++){
           nota_promedio += notas_materias[_materias[i]][_bimestre[i]];
        }
 
        promedio_ = nota_promedio / largoArray;  
        return promedio_;
    }
}