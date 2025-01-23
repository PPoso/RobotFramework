# Mene https://www.w3schools.com/html/html_forms.asp, täytä lomake, tarkista että tiedot lähetettiin.

*** Settings ***
Library  SeleniumLibrary

Test Setup    Open Browser    ${url}    ${selain}
Test Teardown    Close Browser

*** Variables ***
${url}    https://nimipalvelu.dvv.fi/suosituimmat-etunimet    
${url2}    https://www.w3schools.com/html/html_forms.asp
${etunimi1}    //*[@id="main"]/div[2]/div[2]/div[2]/section[1]/table/tbody/tr[1]/td[2]/a
${sukunimiURL}    //*[@id="content"]/section/div/div/nav/ul/li[5]/a
${sukunimi1}    //*[@id="main"]/div[2]/section/table
${selain}    chrome
${hyväksy}    //*[@id="accept-choices"]
${etunimet}    //*[@id="fname"]
${sukunimet}    //*[@id="lname"]
${submit}    //*[@id="main"]/div[3]/div/form/input[3]             

# Tämä voisi ehkä hakea jostakin yleisimmät ihmisten nimet ja käyttää niitä arvoja millä luo formssin.
*** Test Cases ***
Käy lomake lävitse
    [Documentation]    Käy lomakkeen lävitse eri nimillä ja tarkistaa menikö se oikein.
    Maximize Browser Window

    ${etunimi}    Get Text    ${etunimi1}
    Click Link    ${sukunimiURL}
    Wait Until Page Contains Element    ${sukunimi1}   
    ${sukunimi}    Get Table Cell    ${sukunimi1}    2    2          

    Open Browser    ${url2}    ${selain}


    Wait Until Page Contains Element    ${hyväksy}
    Click Element    ${hyväksy}
   
    Clear Element Text    ${etunimet}
    Input Text    ${etunimet}    ${etunimi}
    Input Text    ${sukunimet}    ${sukunimi}  
    Click Element    ${submit}
    Switch Window    NEW

    Wait Until Page Contains    ${etunimi}    10s    
    Page Should Contain    ${etunimi}    10s
    Page Should Contain    ${sukunimi}

    Close Window  
