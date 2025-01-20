*** Settings ***
Library  SeleniumLibrary

# Aukaisee googlen chromella ja lopuksi sulkee sen
Test Setup  Open Browser  ${sivu}  chrome
Test Teardown  Close Browser

*** Variables ***

${sivu}  https://www.bing.com/
${evästesivu}  id=bnp_container
${eväste}  id=bnp_btn_accept
${nappula}  id=sb_form_q

*** Test Cases ***
Testi millä haetaan binghaulla.
    [Documentation]  Etsi binghaulla tietyllä hakusanalla ja tarkista, että ensimmäinen tulos sisältää hakusanan, paina ensimmäistä tulosta.
    Maximize Browser Window

# Odottaa että evästesivu tulee esille. Periaatteessa toimisi ilman että odottaa elementin tulemista
# mutta menee pelkällä Sleepillä. Ei hyvä käytäntö, palaa tähän myöhemmin.
  #  Wait Until Element Is Visible  ${evästesivu}  10s 
    Sleep  2s
    Click Button  ${Eväste}

# Kirjoittaa hakukenttään testiautomaatio ja painaa enter näppäintä
    Input Text  ${nappula}  Testiautomaatio
    Press Keys  ${nappula}  RETURN
    
    Sleep  5s










    #Tarkista ilmatieteenlaitokselta jostakin kaupungista sää, tarkista että lämpötila näkyy.

    # Etsi wikipediasta jollakin hakusanalla ja tarkista avautuvasta sivusta, että se sisältää kyseisen hakusanan.

    # Avaa youtube, etsi joku video ja paina sitä, varmista että video alkaa pyörimään.

    # Mene https://www.w3schools.com/html/html_forms.asp, täytä lomake, tarkista että tiedot lähetettiin.

    # Kokeile eri kirjastoja esim. Browser ja Qweb