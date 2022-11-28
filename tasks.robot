*** Settings ***
Documentation    Insert the sales data for the week and export it as a PDF
Library    RPA.Browser.Selenium    auto_close=${false}
Library    RPA.Desktop

*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open the intranet website
    Log in 
    Fill and submit the Form
    Wait Until Page Contains Element    id:sales-fordwadm
    Log    Done.

*** Keywords ***
Open the intranet website
    Open Available Browser     https://robotsparebinindustries.com/

Log in
    Input Text    username    maria
    Input Text    password    thoushallnotpass
    Submit Form
    Wait Until Page Contains Element    id:sales-form

Fill and submit the Form
    Input Text    firstname    John
    Input Text    lastname    Smith
    Select From List By Value    salestarget    10000
    Input Text    salesresult    123
    Click Button    Submit