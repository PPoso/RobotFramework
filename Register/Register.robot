*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${sivu}  https://www.onlinesim.io/

*** Test Cases ***
Rekisteröi Onlinesim.io palveluun.
    [Documentation]  Automatisoi robotti painamaan https://humanbenchmark.com/tests/reactiontime sivustoa ja katso kuinka nopeasti se pystyy siihen.


    Open Browser  ${sivu}  chrome
    Maximize Browser Window
    Sleep  5s
    Click Element    xpath=//span[text()="Sign Up"]
    Sleep  10s
    Close Browser

    # Tee google-haun testaaminen muutamalla lisällä. Etsi hakusanalla jotakin, tarkista että ensimmäinen tulos sisältää hakusanan, paina ensimmäistä tulosta
    # Avaa uusi sivu

    #Tarkista ilmatieteenlaitokselta jostakin kaupungista sää, tarkista että lämpötila näkyy.

    # Etsi wikipediasta jollakin hakusanalla ja tarkista avautuvasta sivusta, että se sisältää kyseisen hakusanan.

    # Avaa youtube, etsi joku video ja paina sitä, varmista että video alkaa pyörimään.

    # Mene https://www.w3schools.com/html/html_forms.asp, täytä lomake, tarkista että tiedot lähetettiin.

    # Kokeile eri kirjastoja esim. Browser ja Qweb