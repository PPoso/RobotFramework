# Mene https://www.w3schools.com/html/html_forms.asp, täytä lomake, tarkista että tiedot lähetettiin.

*** Settings ***
Library  SeleniumLibrary

Test Setup    Open Browser    ${url}    ${selain}
Test Teardown    Close Browser

*** Variables ***
${url}    https://www.w3schools.com/html/html_forms.asp
${selain}    chrome
${hyväksy}    //*[@id="accept-choices"]
${etunimet}    //*[@id="fname"]
${sukunimet}    //*[@id="lname"]
&{etunimi}    nimi=Matti    nimi1=Janne    nimi2=Jonne
&{sukunimi}    suku=Järvinen    suku1=Sukula    suku2=Virtanen
${submit}    //*[@id="main"]/div[3]/div/form/input[3]        


*** Test Cases ***
Käy lomake lävitse
    [Documentation]    Käy lomakkeen lävitse käyttäen argumentteja
    Click Element    ${hyväksy}
    Clear Element Text    ${etunimet}
    Input Text    ${etunimet}    ${etunimi}
    Input Text    ${sukunimet}    ${sukunimi}  
    Click Element    ${submit}
    Sleep    5s    
    
    

