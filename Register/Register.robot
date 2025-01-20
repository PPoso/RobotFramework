*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${sivu}  https://www.onlinesim.io/

*** Test Cases ***
Rekisteröi Onlinesim.io palveluun.
    [Documentation]  Automatisoi robotti painamaan https://humanbenchmark.com/tests/reactiontime sivustoa ja katso kuinka nopeasti se pystyy siihen.


    Open Browser  ${sivu}  chrome
    Maximize Browser Window
    Sleep  5s
    Click Element    xpath=//span[text()="Sign Up"]
    Sleep  10s
    Close Browser