*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Cargar Website
    Go To  ${START_URL}

Verificar Website cargado
    Wait Until Page Contains  ${HOMEPAGE_TITLE}