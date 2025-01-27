*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://nimipalvelu.dvv.fi/suosituimmat-etunimet    
${etunimi1}    //*[@id="main"]/div[2]/div[2]/div[2]/section[1]/table/tbody/tr[1]/td[2]/a    
${sukunimiURL}    //*[@id="content"]/section/div/div/nav/ul/li[5]/a
${sukunimi1}    //*[@id="main"]/div[2]/section/table

*** Keywords ***
# Hakee Suosituimman etunimen sekä etunimen ja tallentaa nämä arvot
Hae Etunimi Ja Sukunimi
    Maximize Browser Window
    ${etunimi}    Get Text    ${etunimi1}
    Click Element    ${sukunimiURL}
    Wait Until Page Contains Element    ${sukunimi1}
    ${sukunimi}    Get Table Cell    ${sukunimi1}    2    2
    Close Browser
    RETURN    ${etunimi}    ${sukunimi}
