*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://www.example.com/login
${BROWSER}         Chrome
${USERNAME}        your_username
${PASSWORD}        your_password
${USERNAME_FIELD}  id=username      # The HTML element locator for the username field
${PASSWORD_FIELD}  id=password      # The HTML element locator for the password field
${LOGIN_BUTTON}    id=login-button  # The HTML element locator for the login button

*** Test Cases ***
Valid User Can Login Successfully
    Launch Browser and Open Login Page    ${URL}    ${BROWSER}
    Fill Username in Login Form    ${USERNAME}
    Fill Password in Login Form    ${PASSWORD}
    Submit Login and Confirm Successful Login
    Close Browser After Test

*** Keywords ***
Launch Browser and Open Login Page
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Fill Username in Login Form
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Fill Password in Login Form
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Submit Login and Confirm Successful Login
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain    Welcome

Close Browser After Test
    Close Browser

