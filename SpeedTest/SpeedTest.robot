# Create a robot that does speedtest.net network speedtest and logs the download and upload values.
*** Settings ***
Library   Browser
Library    SeleniumLibrary

*** Variables ***

${page}    https://playwright.dev
${button}    css=span > getStarted_Sjon

*** Test Cases ***
Example Test
    New Page    ${page}
    Browser.Get Text    h1    contains    Playwright
 #   Click    ${button}    