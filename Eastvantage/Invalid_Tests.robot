*** Settings ***
Documentation     Negative test cases for https://login.optimyapp.com/
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://login.optimyapp.com/
${BROWSER}        Chrome

*** Test Cases ***
Verify Invalid Email Address
    Open Browser To Login Page
    Input Email    test
    Input Password    123456
    Login
    Invalid Email Format
    [Teardown]    Close Browser

Verify Empty Email Addresss
    Open Browser To Login Page
    Input Email    ${EMPTY}
    Input Password    123456
    Login
    Field is required
    [Teardown]    Close Browser

Verify Empty Password
    Open Browser To Login Page
    Input Email    test@ymail.com
    Input Password    ${EMPTY}
    Login
    Field is required
    [Teardown]    Close Browser

Verify Empty Email Addresss And Password
    Open Browser To Login Page
    Input Email    ${EMPTY}
    Input Password    ${EMPTY}
    Login
    Fields are required
    [Teardown]    Close Browser

Verify Invalid Email Address For Lost Password
    Open Browser To Login Page
    Lost Password
    Input Email    test
    Invalid Email Format
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Optimy login

Input Email
    [Arguments]    ${email}
    Input Text    name=email    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    name=password    ${password}

Login
    Click Button    Login

Invalid Email Format
    Page Should Contain    Please enter a valid email address (e.g.: john.smith@gmail.com).

Field is required
    Page Should Contain    This field is required.

Fields are required
    Page Should Contain    This field is required.    limit=2

Lost Password
    Click Link    Lost password?
