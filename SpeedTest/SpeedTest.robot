*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${sivusto}  https://humanbenchmark.com/tests/reactiontime
${nappula}  xpath=//button[contains(text(), 'Consent')]

*** Test Cases ***
Automatisoi robotti painamaan reaktioaikatestiä mahdollisimman nopeasti
    [Documentation]  Automatisoi robotti painamaan https://humanbenchmark.com/tests/reactiontime sivustoa ja katso kuinka nopeasti se pystyy siihen.


    Open Browser  ${sivusto}  chrome
    Maximize Browser Window
    Sleep  3s

Paina evästeasetuksista Consent
    Click Button    xpath=//button[contains(., 'Consent')] 
    Sleep   3s


    Click Element  //*[@id="root"]/div/div[4]/div[1]
    Sleep  10s
    Click Element  xpath=//div[contains(@class, "view-go")]
    Sleep  3s
    Close Browser