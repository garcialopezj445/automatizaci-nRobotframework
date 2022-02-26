*** Settings ***
Documentation       Existe en un documento de texto los pasos manuales
...                 Esta es mi primera automatizacion

      

Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database

Library             DatabaseLibrary
Library             OperatingSystem
Library             Selenium2Library
Library             ScreenCapLibrary


*** Variables ***
${DBHost}         127.0.0.1
${DBName}         naturaltour
${DBPass}         123
${DBPort}         3306
${DBUser}         natural
${alias}          video

${localhost}         http://localhost:8080/naturaltour/principal.jsp


*** Test Cases ***
G001 Inicio captura de video
    Start Video Recording   alias=${alias} name=${SUITE NAME}

G002 Consulta SQL (Consultar tabla registro)
    [Tags]    db    smoke
    ${output} =    Execute SQL String    SELECT * FROM registro;
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

G003 Consulta SQL (insertar dato en tabla calificarp)
    [Tags]    db    smoke
    ${output} =    Execute SQL String    INSERT INTO calificarp (email, califica) VALUES ("diego@gmail.com","4");
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

G004 Consulta SQL (editar dato en tabla calificarp)
    [Tags]    db    smoke
    ${output} =    Execute SQL String    UPDATE calificarp SET email="manuela@gmail.com", califica="4";
    Log    ${output}
    Should Be Equal As Strings    ${output}    None


G005 Prueba de proyecto
    Open Browser    ${localhost}     chrome 
    sleep  5s
    Close Browser

G006 cierre captura de video
    Stop Video Recording
