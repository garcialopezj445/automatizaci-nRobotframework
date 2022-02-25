*** Settings ***
Library     SeleniumLibrary
Resource    ../automatizaci-nRobotframework/CASO2LOGIN.ROBOT
Suite Setup     Abrir navegador
Suite Teardown      Cerrar navegador
Test template      login invalido       


*** Test Cases ***                                      username        password 
nombre usuario correcto contraseña incorrecta           jose@gmail.com	aqaq
nombre usuario incorrecto contraseña correcta           aqaq            123
nombre usuario correcto contraseña vacia                jose@gmail.com	${EMPTY}
nombre usuario vacio contraseña correcta                ${EMPTY}        123
nombre usuario incorrecto contraseña incorrecta         qwqw            qaqaq


*** Keywords *** 
login invalido
    [Arguments]     ${username}     ${password}
    Ingresando nombre de usuario    ${username}
    Ingresando contraseña    ${password}
    Seleccionar boton de logueo