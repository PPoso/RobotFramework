*** Settings ***
Library  SeleniumLibrary


Test Setup    Open Browser    ${page}    chrome
Test Teardown    Close Browser

*** Variables ***

${page}    https://www.ilmatieteenlaitos.fi/
${acceptcookies}    //*[@id="cookie-consent-content"]/div/div/div[2]/button[2]    
${searchpage}    //*[@id="header-search-location-field"]
@{cities}    Helsinki    Vantaa    Espoo    Jyväskylä    Hämeenlinna    Kuopio
${firstlist}    //*[@id[contains(., '__BVID__')]]

*** Test Cases ***

Check the weather
    [Documentation]    Checks the current weather on a chosen area and returns the temperature value.


    Maximize Browser Window
    Click Button    ${acceptcookies}

    Input Text    ${searchpage}    ${cities}[3]    # Takes a value from cities list
    Press Keys    ${searchpage}    RETURN

    Wait Until Element Is Visible    ${firstlist}    timeout=10s
    ${value}   Get Table Cell   ${firstlist}    4    2    # Gets the current hour value from a table
    Log    ${value}