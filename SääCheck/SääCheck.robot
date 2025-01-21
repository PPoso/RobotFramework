*** Settings ***
Library  SeleniumLibrary

# Tarkista ilmatieteenlaitokselta jostakin kaupungista sää, tarkista että lämpötila näkyy.

Test Setup    Open Browser    ${startti}    chrome
Test Teardown    Close Browser

*** Variables ***

${startti}    https://www.ilmatieteenlaitos.fi/
${buttonEväste}    //*[@id="cookie-consent-content"]/div/div/div[2]/button[2]    
${hakuValikko}    //*[@id="header-search-location-field"]
@{kaupungit}    Helsinki    Vantaa    Espoo    Jyväskylä
${listaEka}    //*[@id[contains(., '__BVID__')]]

*** Test Cases ***

# Tarkista ilmatieteenlaitokselta jonkun kaupungin sää ja tarkista, että lämpötila näkyy.

Lämpötilan checkaus
    Maximize Browser Window
# Hyväksyy evästeet, syöttää lista variablesta ensimmäisen indeksin, mikä sisältää Helsinki arvon.
# Painaa enteriä
    Click Button    ${buttonEväste}
    Input Text    ${hakuValikko}    ${kaupungit}[0]
    Press Keys    ${hakuValikko}    RETURN
# Odottaa kunnes taulukko on latautunut ja tallentaa arvon kohdassa row 1 column 1
# tämän jälkeen pitäisi esittää arvo logissa, mutta näyttää nyt päivämäärät arvona.
# korjaillaan myöhemmin oikeat sarakkeet
    Wait Until Element Is Visible    ${listaEka}    timeout=10s
    ${arvo}   Get Table Cell   ${listaEka}    1    1
    Log    ${arvo}
    Sleep    5s
