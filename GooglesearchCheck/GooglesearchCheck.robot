*** Settings ***
Library  SeleniumLibrary

# Aukaisee googlen chromella ja lopuksi sulkee sen
Test Setup  Open Browser  ${sivu}  chrome
Test Teardown  Close Browser

*** Variables ***

${sivu}  https://www.google.com/
${nappula}  xpath=//button[contains(., 'Consent')]

*** Test Cases ***
Rekisteröi Onlinesim.io palveluun.
    [Documentation]  Etsi googlehaulla tietyllä hakusanalla ja tarkista, että ensimmäinen tulos sisältää hakusanan, paina ensimmäistä tulosta.

    # Suurentaa ikkunan
    Maximize Browser Window

    Click Button    ${nappula}

    Sleep  3s










    #Tarkista ilmatieteenlaitokselta jostakin kaupungista sää, tarkista että lämpötila näkyy.

    # Etsi wikipediasta jollakin hakusanalla ja tarkista avautuvasta sivusta, että se sisältää kyseisen hakusanan.

    # Avaa youtube, etsi joku video ja paina sitä, varmista että video alkaa pyörimään.

    # Mene https://www.w3schools.com/html/html_forms.asp, täytä lomake, tarkista että tiedot lähetettiin.

    # Kokeile eri kirjastoja esim. Browser ja Qweb