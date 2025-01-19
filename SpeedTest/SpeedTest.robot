*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${sivusto}  https://humanbenchmark.com/tests/reactiontime
${nappula}  xpath=//button[contains(., 'Consent')]
${alku}  //*[@id="root"]/div/div[4]/div[1]
${vihree}  xpath=//div[contains(@class, "view-go")]

*** Test Cases ***
Automatisoi robotti painamaan reaktioaikatestiä mahdollisimman nopeasti
    [Documentation]  Automatisoi robotti painamaan https://humanbenchmark.com/tests/reactiontime sivustoa ja katso kuinka nopeasti se pystyy siihen.


    Open Browser  ${sivusto}  chrome
    Maximize Browser Window

Paina evästeasetuksista Consent
    Click Button    ${nappula}


    Click Element  ${alku}
    Wait Until Element Is Visible  ${vihree}  timeout=10s
    Click Element  ${vihree}
    Capture Page Screenshot
    Sleep  3s
    Close Browser