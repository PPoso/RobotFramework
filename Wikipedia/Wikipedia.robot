# Etsi wikipediasta jollakin hakusanalla ja tarkista avautuvasta sivusta, että se sisältää kyseisen hakusanan.
# Käy lävitse listavariablen eri sanoilla for loopilla

*** Settings ***
Library  SeleniumLibrary

Test Setup    Open Browser    ${wikipedia}    chrome
Test Teardown    Close Browser

*** Variables ***

${wikipedia}    https://fi.wikipedia.org/wiki/Wikipedia:Etusivu
&{lista}    sivu1=Robot Framework    sivu2=Selenium    sivu3=Tietotekniikka   
${haku}    css:input[name='search']

*** Test Cases ***

Wikipedian aukasu
    Maximize Browser Window
# Käyttää FOR looppia käydäkseen kaikki listavariablen hakusanat lävitse ja tarkistaa, että sivu sisältää kyseisen hakusanan.    
    FOR  ${key}  ${sivu}  IN  &{lista}
        Input Text    ${haku}    ${sivu}
        Press Keys    ${haku}    RETURN
        Sleep    2s
        Page Should Contain    ${sivu}
    END    
    Sleep    2s          
