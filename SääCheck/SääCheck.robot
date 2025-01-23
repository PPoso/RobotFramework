*** Settings ***
Library  SeleniumLibrary

# Tarkista ilmatieteenlaitokselta jostakin kaupungista sää ja tarkista että lämpötila näkyy.

Test Setup    Open Browser    ${startti}    chrome
Test Teardown    Close Browser

*** Variables ***

${startti}    https://www.ilmatieteenlaitos.fi/
${buttonEväste}    //*[@id="cookie-consent-content"]/div/div/div[2]/button[2]    
${hakuValikko}    //*[@id="header-search-location-field"]
@{kaupungit}    Helsinki    Vantaa    Espoo    Jyväskylä    Hämeenlinna    Kuopio
${listaEka}    //*[@id[contains(., '__BVID__')]]

*** Test Cases ***

# Tarkista ilmatieteenlaitokselta jonkun kaupungin sää ja tarkista, että lämpötila näkyy.

Lämpötilan checkaus
    Maximize Browser Window
# Hyväksyy evästeet, syöttää lista variablesta ensimmäisen indeksin, mikä sisältää kaupungeista arvon.
# Painaa enteriä
    Click Button    ${buttonEväste}
    Input Text    ${hakuValikko}    ${kaupungit}[3]
    Press Keys    ${hakuValikko}    RETURN
# Odottaa kunnes taulukko on latautunut ja tallentaa arvon kohdassa row 4 column 2
# Näyttää nykyisen tunnin lämpötilan logissa.
# muuttaa arvon stringiksi.
    Wait Until Element Is Visible    ${listaEka}    timeout=10s
    ${arvo}   Get Table Cell   ${listaEka}    4    2
     Convert To String    ${arvo}
# Poistaa celsiusmerkin merkkijonosta, tallentaa arvon stringinä temp variableen oikein.
# kysymys kuuluukin miten saadaan temp variablesta tiedot pihalle
# Logaa nyt alustavasti nykyisen tunnin lämpötilan aivan oikein.
    Execute Javascript    text = "${arvo}";    console.log(typeof text);    temp = text.replace("\u00B0", "");
    Log    ${arvo}