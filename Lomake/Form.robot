*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url_w3}    https://www.w3schools.com/html/html_forms.asp
${accept}    css:div#accept-choices     
${first_names}    css:input[name='fname']
${last_names}    css:input[name='lname']
${submit}    css:input[type=submit]
${browser}    chrome

*** Keywords ***
# Avaa lomakesivun ja hyväksyy evästeasetukset
Avaa Lomakesivu
    Open Browser    ${url_w3}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${accept}
    Click Element    ${accept}

# Täyttää lomakkeen käyttäen tallennettuja arvoja
Täytä Ja Lähetä Lomake
    [Arguments]    ${first_name}    ${last_name}
    Input Text    ${first_names}    ${first_name}
    Input Text    ${last_names}    ${last_name}  
    Click Element    ${submit}
    Switch Window    NEW

# Tarkistaa lomakkeesta, että se sisältää yleisimmän etu- ja sukunimen.
Tarkista Lomakkeen Lähetys
    [Arguments]    ${etunimi}    ${sukunimi}
    Wait Until Page Contains    ${etunimi}    10s    
    Page Should Contain    ${etunimi}    10s
    Page Should Contain    ${sukunimi}