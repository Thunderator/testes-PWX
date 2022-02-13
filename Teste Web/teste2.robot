*** Settings ***
Documentation       Teste 2.
Library             SeleniumLibrary
Test Teardown       Fecha Navegacao

*** Variables ***
${URL}              http://automationpractice.com/index.php
${BROWSER}          Chrome

*** Test Cases ***
PesquisarProdutosNaoExistentes
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
  Input Text      //*[@id="search_query_top"]     produtoNãoExistente

Clicar Lupa
  Sleep           2
  Click Element   //*[@name="submit_search"]
  Sleep           2
  Wait Until Element Is Visible     //*[contains (text(), "produtoNãoExistente")]

Fecha Navegacao
  run keyword and ignore error  _teardown

_teardown
  Close Browser