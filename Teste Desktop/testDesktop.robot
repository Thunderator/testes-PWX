*** Settings ***
Documentation       Teste Desktop.
Library             SikuliLibrary

*** Variables ***
${IMAGE_DIR}      ${CURDIR}\\img

*** Test Cases ***
TestDesktop
  Clicar Windows
  Fazer Pesquisa
  Escrever Texto
  Checar Texto
  Fecha Notepad

*** Keywords ***
Add Needed Image Path
  Add Image Path      ${IMAGE_DIR}

Clicar Windows
  Click               botaoWin.png

Fazer Pesquisa
  Input text	        ${EMPTY}	Notepad
  Sleep               1
  SikuliLibrary.Press Special Key   ENTER

Escrever texto
  Click               maximizar.png
  Input text	        ${EMPTY}	PWX Tecnologia
  Sleep               2

Checar texto
  Wait Until Screen Contain     texto.png

Fecha Notepad
  Click               fechar.png
  Sleep               1
  Click               naoSalvar.png