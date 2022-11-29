*** Settings ***
Documentation    Insert the sales data for the week and export it as a PDF
Library    RPA.Browser.Selenium    auto_close=${FALSE}
Library    RPA.Desktop
Library    RPA.HTTP
Library    RPA.Excel.Files

*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open the intranet website
    Log in 
    Download the Excel file
    Fill the form using the data from the Excel file
    Collect the results
    Log    Done.

*** Keywords ***
Open the intranet website
    Open Available Browser     https://robotsparebinindustries.com/

Log in
    Input Text    username    maria
    Input Text    password    thoushallnotpass
    Submit Form
    Wait Until Page Contains Element    id:sales-form

Download the Excel file
    Download    https://robotsparebinindustries.com/SalesData.xlsx    overwrite=True

Fill the form using the data from the Excel file
    Open Workbook    SalesData.xlsx
    ${sales_reps}=    Read Worksheet As Table    header=True
    FOR    ${sales_rep}    IN    @{sales_reps}
        Fill and submit Form for one person    ${sales_rep}
    END
    Close Workbook


Fill and submit Form for one person
    [Arguments]    ${sales_reps}
    Input Text    firstname    ${sales_reps}[First Name]
    Input Text    lastname    ${sales_reps}[Last Name]
    Select From List By Value    salestarget    ${sales_reps}[Sales Target]
    Input Text    salesresult    ${sales_reps}[Sales]
    Click Button    Submit

Collect the results
    Screenshot    css:div.sales-summary    ${OUTPUT_DIR}${/}sales_summary.png