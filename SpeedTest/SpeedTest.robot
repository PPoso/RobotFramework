*** Settings ***
Library  SeleniumLibrary

Test Setup    Open Browser  ${page}  chrome
Test Teardown    Close Browser    

*** Variables ***

${page}  https://humanbenchmark.com/tests/reactiontime
${button}  xpath=//button[contains(., 'Consent')]
${start}  //*[@id="root"]/div/div[4]/div[1]
${stop}  xpath=//div[contains(@class, "view-go")]

*** Test Cases ***
SpeedTesting
    [Documentation]  Automate a robot to complete the speedtest as fast as possible by clicking on the screen when it turn green.

    Maximize Browser Window
    Click Button    ${button}

# Starts the game
    Click Element  ${start}

# Completes it
    Wait Until Element Is Visible  ${stop}  timeout=10s
    Click Element  ${stop}

# Takes screenshot of the results.
    Capture Page Screenshot