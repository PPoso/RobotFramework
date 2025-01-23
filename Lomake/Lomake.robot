*** Settings ***
Library  SeleniumLibrary
Resource    Nimihaku.robot
Resource    Form.robot

Test Setup    Open Browser    ${url}    ${selain}
Test Teardown    Close Browser

*** Variables ***
${selain}    chrome

*** Test Cases ***
Käy lomake lävitse
    [Documentation]    Käy lomakkeen läpi eri nimillä ja tarkistaa tuloksen.

    ${etunimi}    ${sukunimi}    Hae Etunimi Ja Sukunimi

    Avaa Lomakesivu
    Täytä Ja Lähetä Lomake    ${etunimi}    ${sukunimi}
    Tarkista Lomakkeen Lähetys    ${etunimi}    ${sukunimi}

    # Kommentoi mitä näissä tapahtuu vielä
