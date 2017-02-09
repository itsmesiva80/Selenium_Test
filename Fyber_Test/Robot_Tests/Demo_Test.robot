*** Settings ***
Library           Selenium2Library

*** Variables ***
${URL}            http://www.imdb.com/chart/top
${BROWSER}        Firefox
${DELAY}          0
${TITLE}          IMDb Top 250 - IMDb
*** Test Cases ***
Launch Application
    Open Home Page
    Verify Title

Verify Movies listed By Default
    Verify Number Of Movies Displayed

*** Keywords ***
Open Home Page
   Open Browser    ${URL}    ${BROWSER}
   Maximize Browser Window
   Set Selenium Speed    ${DELAY}

Verify Title
    Title Should Be     ${TITLE}

Verify Number Of Movies Displayed
    Table Should Contain    xpath=//table[@data-caller-name='chart-top250movie']/tbody/tr|count  250
