# TP_Chona
TP Smart Contract

Integrantes del grupo: Franco Sandri y Luciano Del Arco
_________________________________________________________________________________________________________________________________________________________________________

Problemas extra:

a. Crear un mapping dentro del mapping notas_materias. Incluir en el set notas_materias el bimestre al que pertenece la nota, que puede ser mayor o igual a 1 y menor o igual a 4. Y al momento de pedir tanto la nota, como el promedio o la aprobación, indicar el bimestre al que corresponde.

b. Crearía un array que guarde los addresses de los docentes autorizados. Después, al momento de corroborar que el docente esté incluido, hago una estructura for que vaya pasando por cada uno de los valores del array, haciendo así que si el msg.sender se encuentra en el mismo, devuelva true, sino false. Además, una función que permita agregar a los docentes, y que estos no estén repetidos.

c. Lo que haríamos sería declarar un evento en el contrato el cual devuelva un address, un string y un entero. Después en la función set_nota_materia hacemos un emit de esa función ingresando los valores del msg.sender, la materia y la nota correspondiente. Entonces, cuando el docente setea la nota del usuario, le aparece el evento. 
_________________________________________________________________________________________________________________________________________________________________________

Links a Etherscan:

Estudiante.sol: https://rinkeby.etherscan.io/address/0x7d490ee2105f58d9a070a4e437ec080d3fd0d58c

EstudianteAlt.sol: https://rinkeby.etherscan.io/address/0x5689E98C91D39d97ce89CadD9527D036D1b03520
