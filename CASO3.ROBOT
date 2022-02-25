*** Settings ***
Documentation       Existe en un documento de texto los pasos manuales
...                 Esta es mi primera automatizacion

Library             Selenium2Library
Library             ScreenCapLibrary
Library             OperatingSystem
Library             DatabaseLibrary

Test Teardown       Remove File  screenshot_1.jpg
Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database

*** Variables ***
${DBHost}         127.0.0.1
${DBName}         naturaltour
${DBPass}         123
${DBPort}         3306
${DBUser}         natural
${alias}          video
${correo}	pepita@hotmail.com
${nombre}	pepita velez
${opinion}	Esta sera mi opinion
${correoactual}	pepita@gmail.com
${nombreactual}	pepa velez
${opinionactual}	opinion actualizada
${primera}	si
${segunda}	bien
${tercera}	si
${mensaje}	Necesito estar en contacto
${documento}	10133366
${cnombre}	juanita
${apellido}	gomez
${email}	juanita0192@gmail.com
${contraseña}	123

*** Test Cases ***
G001 Inicio captura de video
    Start Video Recording   alias=${alias} name=${SUITE NAME}
   
G002 Crear nueva opinion
    Open Browser    http://localhost:8080/naturaltour/principal.jsp     chrome 
    sleep  15s
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]
    sleep  5s
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]/div/a[7]
    sleep  5s
    Click Element	xpath=/html/body/div[1]/div/a/button
    sleep  5s
    Input Text	xpath=/html/body/div[1]/div/form/input[1]	${correo}
    sleep  2s
    Input Text	xpath=/html/body/div[1]/div/form/input[2]	${nombre}
    sleep  2s
    Input Text	xpath=/html/body/div[1]/div/form/input[3]	${opinion}
    sleep  7s
    Click Element	xpath=/html/body/div[1]/div/form/div/input
    sleep  10s
    
G003 Editar la opinion
    Click Element	xpath=/html/body/div[1]/div/table/tbody[4]/tr/td[5]/a[1]
    sleep  5s
    Input Text	xpath=/html/body/div[1]/div/form/input[1]	${correoactual}
    sleep  2s
    Input Text	xpath=/html/body/div[1]/div/form/input[2]	${nombreactual}
    sleep  2s
    Input Text	xpath=/html/body/div[1]/div/form/input[3]	${opinionactual}
    sleep  7s
    Click Element	xpath=/html/body/div[1]/div/form/div/input
    sleep  10s

G004 Eliminar la opinion
    click Element	xpath=/html/body/div[1]/div/table/tbody[4]/tr/td[5]/a[2]
    sleep  5s
    Click Element	xpath=/html/body/div[1]/nav/div/div/div/div/ul/li/a/hidden/img
    sleep  10s

G005 Vizualizar "quienes somos"
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]
    sleep  5s
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]/div/a[1]
    sleep  10s
    Click Element	xpath=/html/body/div[1]/nav/div/div/div/div/ul/li/a/hidden/img
    sleep  10s

G006 Vizualizar "sobre nosotros"
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]
    sleep  5s 
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]/div/a[2]
    sleep  10s
    Click Element	xpath=/html/body/div[1]/nav/div/div/div/div/ul/li/a/hidden/img
    sleep  10s

G007 Responder encuesta
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]
    sleep  5s 
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]/div/a[3]
    sleep  5s
    Input Text	xpath=//*[@id="nombre"]	${nombre}
    sleep  2s
    Input Text	xpath=//*[@id="primera"]	${primera}
    sleep  2s
    Input Text	xpath=//*[@id="segunda"]	${segunda}
    sleep  2s
    Input Text	xpath=//*[@id="tercera"]	${tercera}
    sleep  7s
    Click Element	xpath=/html/body/div/form/input[5]
    sleep  10s
    Click Element	xpath=/html/body/div/nav/a/hidden/img
    sleep  10s

G008 Contactarse mediante el correo electronico
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]
    sleep  5s 
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]/div/a[4]
    sleep  5s
    Input Text	xpath=//*[@id="nombre"]	${nombre}
    sleep  2s
    Input Text	xpath=//*[@id="email"]	${correo}
    sleep  2s
    Input Text	xpath=//*[@id="mensaje"]	${mensaje}
    sleep  7s
    Click Element	xpath=/html/body/div[1]/form/div/div/div[3]/div/a/input
    sleep  30s 
    Click Element	xpath=/html/body/div[4]/div/div[4]/div/button
    sleep  5s
    Click Element	xpath=/html/body/div[1]/nav/div/div/div/div/ul/li/a/hidden/img
    sleep  10s

G009 Calificar lugares ecologicos
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]
    sleep  5s 
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]/div/a[5]
    sleep  5s
    Input Text	xpath=//*[@id="email"]	${correo}
    sleep  2s
    Click Element	xpath=//*[@id="lugar"]/option[4]
    sleep  2s
    Click Element	xpath=//*[@id="cali"]/option[4]
    sleep  7s
    Click Element	xpath=/html/body/div[1]/div/div/form/div/input
    sleep  10s

G010 Calificar pagina web
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]
    sleep  5s 
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[2]/div/a[6]
    sleep  5s
    Input Text	xpath=//*[@id="email"]	${correo}
    sleep  2s
    Click Element	xpath=//*[@id="califica"]/option[3]
    sleep  7s
    Click Element	xpath=/html/body/div[1]/div/div/form/div/input
    sleep  10s
 
G011 Registrarse
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[3]
    sleep  5s
    Click Element	xpath=/html/body/div[1]/nav/div[1]/div/div/div/ul/li[3]/div/a
    sleep  5s
    Input Text	xpath=//*[@id="id"]	${documento}
    sleep  2s
    Input Text	xpath=//*[@id="nombre"]	${cnombre}
    sleep  2s
    Input Text	xpath=//*[@id="apellido"]	${apellido}
    sleep  2s
    Input Text	xpath=//*[@id="email"]	${email}
    sleep  2s
    Input Text	xpath=//*[@id="contra"]	${contraseña}
    sleep  2s
    Input Text	xpath=//*[@id="confirmar"]	${contraseña}
    sleep  7s
    Click Element	xpath=/html/body/div[1]/div/div/form/div/input
    sleep  10s

G012 Iniciar sesion
   Input Text	xpath=//*[@id="email"]	${email}
   sleep  2s
   Input Text	xpath=//*[@id="contra"]	${contraseña}
   sleep  5s
   Click Element	xpath=/html/body/div[1]/div/div/div/form/input[3]
   sleep  10s

G013 Ver lugares ecoturisticos en Medellin
   Click Element	xpath=/html/body/div[1]/div[3]/div/div/a/button
   sleep  20s
   Click Element	xpath=/html/body/div[2]/div[2]/a[1]/input
   sleep  10s
   Click Element	xpath=/html/body/div[1]/div/div[1]/div[2]/a/hidden/img
   sleep  5s
   Click Element	xpath=/html/body/div[2]/div[2]/a[2]/input
   sleep  10s
   Click Element	xpath=/html/body/div[1]/nav/div/div/div/div/ul/li/a/hidden/img
   sleep  10s
   Click Element	xpath=/html/body/div[2]/div[2]/a[3]/input
   sleep  10s
   Close Browser

G014 cierre captura de video
    Stop Video Recording

 















