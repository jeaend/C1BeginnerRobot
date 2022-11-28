*** Settings ***
Documentation    Insert the sales data for the week and export it as a PDF
Library    RPA.Browser.Selenium    auto_close=${FALSE}

*** Tasks ***
Insert the sales data for the week and export it as a PD
    Open the intranet website
    Log in 
    Log    Done.

*** Keywords ***
Open the intranet website
    Open Available Browser     https://robotsparebinindustries.com/

Log in
    Input Text    username    maria
    Input Text    password    thoushallnotpass
    Submit Form 