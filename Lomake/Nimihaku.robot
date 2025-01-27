*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://nimipalvelu.dvv.fi/suosituimmat-etunimet    
${fetch_first}    //*[@id="main"]/div[2]/div[2]/div[2]/section[1]/table/tbody/tr[1]/td[2]/a    
${fetch_lastUrl}    //*[@id="content"]/section/div/div/nav/ul/li[5]/a
${fetch_last}    //*[@id="main"]/div[2]/section/table

*** Keywords ***
# Hakee Suosituimman etunimen sekä etunimen ja tallentaa nämä arvot
Hae Etunimi Ja Sukunimi
    Maximize Browser Window
    ${first_name}    Get Text    ${fetch_first}
    Click Element    ${fetch_lastUrl}
    Wait Until Page Contains Element    ${fetch_last}
    ${last_name}    Get Table Cell    ${fetch_last}    2    2
    Close Browser
    RETURN    ${first_name}    ${last_name}
