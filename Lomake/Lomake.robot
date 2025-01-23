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
@{etunimi}    Matti    Janne    Jonne
@{sukunimi}    Järvinen    Sukula    Virtanen
${submit}    //*[@id="main"]/div[3]/div/form/input[3]        

# Tämä voisi ehkä hakea jostakin yleisimmät ihmisten nimet ja käyttää niitä arvoja millä luo formssin.
*** Test Cases ***
Käy lomake lävitse
    [Documentation]    Käy lomakkeen lävitse eri nimillä ja tarkistaa menikö se oikein.
    Maximize Browser Window
    Wait Until Page Contains Element    ${hyväksy}
    Click Element    ${hyväksy}
    Clear Element Text    ${etunimet}
    Input Text    ${etunimet}    ${etunimi[0]}
    Input Text    ${sukunimet}    ${sukunimi[0]}  
    Click Element    ${submit}
    Sleep    5s    
    
    

