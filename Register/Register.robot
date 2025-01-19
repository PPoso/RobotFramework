*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${sivu}  https://www.google.com/

*** Test Cases ***
Rekisteröi Onlinesim.io palveluun.
    [Documentation]  Automatisoi robotti painamaan https://humanbenchmark.com/tests/reactiontime sivustoa ja katso kuinka nopeasti se pystyy siihen.


    Open Browser  ${sivu}  chrome
    Sleep  10s
    Click Button
    Close Browser
