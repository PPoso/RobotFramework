*** Settings ***
Library  SeleniumLibrary

Test Setup  Open Browser  ${page}  chrome
Test Teardown  Close Browser

*** Variables ***

${page}  https://www.bing.com/
${cookiespage}  id=bnp_container
${cookies}  bnp_btn_accept
${button}  id=sb_form_q
${link}  //*[@id="b_results"]/li[3]/div[1]

*** Test Cases ***
Search from bing and check values
    [Documentation]  Searches from bing with a word and checks that the first result contains the same word. After that opens the page

# Accepts the cookies
    Maximize Browser Window
    Wait Until Page Contains Element  ${cookiespage}  10s
    Execute JavaScript  document.getElementById('${cookies}').click()

# Search with the word Testiautomaatio
    Input Text  ${button}  Testiautomaatio
    Press Keys  ${button}  RETURN

# Checks that it contains the word and presses the first link
    Wait Until Page Contains  Testiautomaatio  10s
    Click Element  ${link} 
    Wait Until Page Contains  Testiautomaatio  10s

    Sleep  3s