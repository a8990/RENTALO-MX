*** Settings ***
Documentation  Suite de pruebas para Rentalo.com.mx
Library           DataDriver    file=RENTALO1.csv
# notice we're no longer referencing the Selenium2Library in our script!
Resource  ../Resources/search_resources.robot
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/RentaloApp.robot  # necessary for lower level keywords in test cases
Resource  ../Resources/PO/LandigPage.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

Test Template   Busqueda Maquinaria Valida 3

*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://rentalo.com.mx/
${HOMEPAGE_TITLE} =  Rentalo
${EQUIPMENT_TITLE} =  Rentalo
${EQUIPMENT_TITLE} =  BOBCAT T590


# Copy/paste the below line to Terminal window to execute
# robot -d results tests/Rentalo.robot

*** Test Cases ***
Logged out - usuario puede buscar items ${machinename}      default
    [Tags]  Smoke
    #RentaloApp.Busqueda de Maquina - Scenario 1
    

*** Keywords ***
Busqueda Maquinaria Valida 3
    [Arguments]    ${machinename} 
    LandingPage.Cargar Website
    LandingPage.Verificar Website cargado
    search_resources.Insertar Nombre de Máquina completo    ${machinename}
    search_resources.El buscador despliega opciones para autocompletar
    search_resources.Presionar Enter
    search_resources.Retorna Catalogo de productos
    #search_resources.Seleccionar opción del nombre desplegado
