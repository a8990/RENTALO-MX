*** Settings ***
Library           SeleniumLibrary

***Variables ***
${EMPTY_CATALOG}    No hay resultados con los parametros de busqueda
${EMPTY_LIST}       No hay resultados para

*** Keywords ***

Insertar Nombre de Máquina completo
    [Arguments]    ${machinename}
    Input Text    id=equipment-query    ${machinename}

El buscador despliega opciones para autocompletar
    Wait Until Page Contains Element   css:[class="flex items-center p-4 hover:bg-gray-200"]
    Capture Page Screenshot

Seleccionar opción del nombre desplegado
    Click Link  xpath=//a[@href="/equipment/bobcat-t590"]

El buscador no muestra resultados
    Wait Until Page Contains     ${EMPTY_LIST}
    Capture Page Screenshot

Presionar Enter
    Press Keys    //*[@id="equipment-query"]    ENTER

Presionar Boton de Busqueda
    Element Should be Visible   xpath=//*[@id="home"]/section[1]/div/div/div/div[1]/div
    Element Should Be Enabled   xpath=//*[@id="home"]/section[1]/div/div/div/div[1]/div
    Click Element   xpath=//*[@id="home"]/section[1]/div/div/div/div[1]/div
    #//*[@id="home"]/section[1]/div/div/div/div[1]/div/svg

Retorna Catalogo de productos
    #Wait Until Page Contains  ${machinename}
    Wait Until Page Contains Element    xpath=//*[@id="catalog"]/div[2]/div/h1
    Get All Links
    Capture Page Screenshot

Retorna Catalogo de productos vacio
    #Wait Until Page Contains  ${machinename}
    Wait Until Page Contains Element    xpath=//*[@id="catalog"]/div[2]/div/h1
    Wait Until Page Contains    ${EMPTY_CATALOG}
    Page Should Not Contain Element     css:[class="block mb-8 rounded-lg border shadow-md overflow-hidden mx-auto"]
    Capture Page Screenshot

Seleccionar Categoria Equipo Mueve Tierra
    #Wait Until Page Contains Element    xpath=//*[@id="catalog"]/div[2]/div/h1
    Element Should be Visible   xpath=//a[@href="/category/equipo-ligero-y-herramietas"]
    Element Should Be Enabled   xpath=//a[@href="/category/equipo-ligero-y-herramietas"]
    Click Link  xpath=//a[@href="/category/equipo-ligero-y-herramietas"]