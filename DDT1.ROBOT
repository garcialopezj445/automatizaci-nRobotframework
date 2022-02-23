*** Settings ***
Library     SeleniumLibrary
Resource    ../automatizacionCoolWork/CASO2LOGIN.ROBOT
Suite Setup     Abrir navegador
Suite Teardown      Cerrar navegador
Test template      login invalido       


*** Test Cases ***                                      username        password 
nombre usuario correcto contraseña incorrecta           123             aqaq
nombre usuario incorrecto contraseña correcta           aqaq            123
nombre usuario correcto contraseña vacia                123             ${EMPTY}
nombre usuario vacio contraseña correcta                ${EMPTY}        123
nombre usuario incorrecto contraseña incorrecta         qwqw            qaqaq


*** Keywords *** 
login invalido
    [Arguments]     ${username}     ${password}
    Ingresando nombre de usuario    ${username}
    Ingresando contraseña    ${password}
    Seleccionar boton de logueo