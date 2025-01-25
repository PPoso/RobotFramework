*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url2}    https://www.w3schools.com/html/html_forms.asp
${hyväksy}    //*[@id="accept-choices"]     
${etunimet}    css:input[name='fname']
${sukunimet}    css:input[name='lname']
${submit}    css:input[type=submit]
${selain}    chrome

*** Keywords ***
# Avaa lomakesivun ja hyväksyy evästeasetukset
Avaa Lomakesivu
    Open Browser    ${url2}    ${selain}
    Maximize Browser Window
    Wait Until Page Contains Element    ${hyväksy}
    Click Element    ${hyväksy}

# Täyttää lomakkeen käyttäen tallennettuja arvoja
Täytä Ja Lähetä Lomake
    [Arguments]    ${etunimi}    ${sukunimi}
    Clear Element Text    ${etunimet}
    Input Text    ${etunimet}    ${etunimi}
    Input Text    ${sukunimet}    ${sukunimi}  
    Click Element    ${submit}
    Switch Window    NEW

# Tarkistaa lomakkeesta, että se sisältää yleisimmän etu- ja sukunimen.
Tarkista Lomakkeen Lähetys
    [Arguments]    ${etunimi}    ${sukunimi}
    Wait Until Page Contains    ${etunimi}    10s    
    Page Should Contain    ${etunimi}    10s
    Page Should Contain    ${sukunimi}
