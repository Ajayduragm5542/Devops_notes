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
    Open Browser And Navigate To Login Page    ${URL}    ${BROWSER}
    Enter Username In Login Form    ${USERNAME}
    Enter Password In Login Form    ${PASSWORD}
    Submit Login Form And Verify Successful Login
    Close Browser After Test

*** Keywords ***
Open Browser And Navigate To Login Page
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Enter Username In Login Form
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Enter Password In Login Form
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Submit Login Form And Verify Successful Login
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain    Welcome

Close Browser After Test
    Close Browser

