*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${sivusto}  https://humanbenchmark.com/tests/reactiontime
${nappula}  xpath=//button[contains(., 'Consent')]
${alku}  //*[@id="root"]/div/div[4]/div[1]
${vihree}  xpath=//div[contains(@class, "view-go")]

*** Test Cases ***
Automatisoi robotti painamaan reaktioaikatestiä mahdollisimman nopeasti
    [Documentation]  Automatisoi robotti painamaan https://humanbenchmark.com/tests/reactiontime sivustoa ja katso kuinka nopeasti se pystyy siihen.

# avaa sovelluksen ja suurentaa ikkunan
    Open Browser  ${sivusto}  chrome
    Maximize Browser Window
# painaa evästeasetuksista eteenpäin
Paina evästeasetuksista Consent
    Click Button    ${nappula}

# painaa ruutua kerran aloittaaksen testin
    Click Element  ${alku}
# odottaa että ruutu vauhtii vihreäksi ja painaa uudestaan pysäyttääkseen testin    
    Wait Until Element Is Visible  ${vihree}  timeout=10s
    Click Element  ${vihree}
# ottaa kuvakaappauksen tuloksista ja sulkee selaimen 
    Capture Page Screenshot
    Close Browser
# Askeleet voisi erotella erikseen, mutta testin lyhykäisyyden takia en sitä tee. Variablet myös omia tekemisiä varten nimetty. :D    