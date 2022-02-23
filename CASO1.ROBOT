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
${DBName}         cool_work
${DBPass}         123
${DBPort}         3306
${DBUser}         user
${alias}          video

${localhost}         http://localhost:4000/


*** Test Cases ***
G001 Consulta SQL (Consultar tabla usuario)
    [Tags]    db    smoke
    ${output} =    Execute SQL String    SELECT * FROM usuario;
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

G002 Consulta SQL (insertar dato en tabla residencia)
    [Tags]    db    smoke
    ${output} =    Execute SQL String    INSERT INTO residencia (codigo_postal, nombre_residencia) VALUES ("1132","aas");
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

G003 Inicio captura de video
    Start Video Recording   alias=${alias} name=${SUITE NAME}

G004 Prueba de proyecto
    Open Browser    ${localhost}     chrome 
    sleep  5s
    Close Browser

G005 cierre captura de video
    Stop Video Recording