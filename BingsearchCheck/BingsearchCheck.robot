*** Settings ***
Library  SeleniumLibrary

# Aukaisee googlen chromella ja lopuksi sulkee sen
Test Setup  Open Browser  ${sivu}  chrome
Test Teardown  Close Browser

*** Variables ***

${sivu}  https://www.bing.com/
${evästesivu}  id=bnp_container
${eväste}  bnp_btn_accept
${nappula}  id=sb_form_q
${linkki}  //*[@id="b_results"]/li[3]/div[1]

*** Test Cases ***
Testi millä haetaan binghaulla.
    [Documentation]  Etsi binghaulla tietyllä hakusanalla ja tarkista, että ensimmäinen tulos sisältää hakusanan, paina ensimmäistä tulosta.
    Maximize Browser Window

# Tarkistaa, että sivusta löytyy evästeasetukset ennen kuin klikkaa hyväksy nappia.
# Ei löytynyt seleniumlibrarysta Wait Until Element is Clickable, joten piti käyttää JavaScriptiä
# Saadakseen sen toimimaan
    Wait Until Page Contains Element  ${evästesivu}  10s
    Execute JavaScript  document.getElementById('${eväste}').click()

# Kirjoittaa hakukenttään testiautomaatio ja painaa enter näppäintä
    Input Text  ${nappula}  Testiautomaatio
    Press Keys  ${nappula}  RETURN
# Tarkistaa sisältääkö hakusanalla haettu sana Testiautomaatio-sanan.
# Painaa ensimmäistä linkkiä ja tarkistaa sivulta sisältääkö se sanan Testiautomaatio
    Wait Until Page Contains  Testiautomaatio  10s
    Click Element  ${linkki} 
    Wait Until Page Contains  Testiautomaatio  10s
# Näyttää sivua hetken aikaa, mikä avattiin
    Sleep  3s