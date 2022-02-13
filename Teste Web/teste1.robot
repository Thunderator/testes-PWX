*** Settings ***
Documentation       Teste 1.
Library             SeleniumLibrary
Test Teardown       Fecha Navegacao

*** Variables ***
${URL}              http://automationpractice.com/index.php
${BROWSER}          Chrome

*** Test Cases ***
PesquisarProdutosExistentes
  Iniciar Navegacao
  Fazer Pesquisa
  Clicar Lupa

*** Keywords ***
Iniciar Navegacao
  Open Browser    ${URL}     ${BROWSER}
  Maximize Browser Window

Fazer Pesquisa
  Click Element   //*[@id="search_query_top"]
  Sleep           2
  Input Text      //*[@id="search_query_top"]     Blouse

Clicar Lupa
  Sleep           2
  Click Element   //*[@name="submit_search"]
  Sleep           2
  Wait Until Element Is Visible     //*[@id="center_column"]/ul/li

Fecha Navegacao
  run keyword and ignore error  _teardown

_teardown
  Close Browser