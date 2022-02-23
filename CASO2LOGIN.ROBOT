*** Settings ***
Library     SeleniumLibrary


*** Variables *** 
${URL}          http://localhost:4000/login
${BROWSER}      chrome
   

*** Keywords ***

Abrir navegador
    Open Browser    ${URL}     chrome 
    sleep  5s

Cerrar navegador
    Close Browser

logueandose en sitio web
    go to http://localhost:4000/login

Ingresando nombre de usuario
    [Arguments]     ${username}
    input text  id:username     ${username}

Ingresando contraseña
    [Arguments]     ${password}
    input text  id:password     ${password}

Seleccionar boton de logueo 
    click element   xpath://*[@id="button-login"]