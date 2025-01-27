
*** Settings ***
Library  SeleniumLibrary

Test Setup    Open Browser    ${wikipedia}    chrome
Test Teardown    Close Browser

*** Variables ***

${wikipedia}    https://fi.wikipedia.org/wiki/Wikipedia:Etusivu
&{searchword}    page1=Robot Framework    page2=Selenium    page3=Tietotekniikka   
${searchbar}    css:input[name='search']

*** Test Cases ***

Open Wikipedia and go through the searchwords
    [Documentation]    Test to go through different searchwords in wikipedia using a for loop.

    Maximize Browser Window 
    FOR  ${key}  ${page}  IN  &{searchword}
        Input Text    ${searchbar}    ${page}
        Press Keys    ${searchbar}    RETURN
        Sleep    2s
        Page Should Contain    ${page}
    END    
    Sleep    2s          
