*** Settings ***
Library     SeleniumLibrary


*** Variables *** 
${URL}          http://localhost:8080/naturaltour/iniciosesion.jsp
${BROWSER}      chrome
   

*** Keywords ***

Abrir navegador
    Open Browser    ${URL}     chrome 
    sleep  5s

Cerrar navegador
    Close Browser

logueandose en sitio web
    go to http://localhost:8080/naturaltour/iniciosesion.jsp

Ingresando nombre de usuario
    [Arguments]     ${username}
    input text  id:email     ${username}

Ingresando contraseña
    [Arguments]     ${password}
    input text  id:contra     ${password}

Seleccionar boton de logueo 
    click element   xpath=/html/body/div[1]/div/div/div/form/input[3]