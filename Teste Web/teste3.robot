*** Settings ***
Documentation       Teste 3.
Library             SeleniumLibrary
Test Teardown       Fecha Navegacao

*** Variables ***
${URL}              http://automationpractice.com/index.php
${BROWSER}          Chrome

*** Test Cases ***
ListarProdutos
  Iniciar Navegacao
  Passa por Cima
  Clicar Subcategoria

*** Keywords ***
Iniciar Navegacao
  Open Browser    ${URL}     ${BROWSER}
  Maximize Browser Window

Passa por Cima
  Mouse Over      //*[@id="block_top_menu"]//*[contains (text(), "Women")]
  Sleep           2

Clicar Subcategoria
  Click Element   //*[@title="Summer Dresses"]
  Sleep           2
  Wait Until Element Is Visible     //*[@id="center_column"]/h1//*[contains (text(), "Summer Dresses")]

Fecha Navegacao
  run keyword and ignore error  _teardown

_teardown
  Close Browser
