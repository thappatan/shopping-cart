*** Settings ***
Library     RequestsLibrary

*** Test Cases ***
Get Products
    Create Session    product      http://localhost:8000/api/v1
    ${resp}=   Get Request    product    /product
    Request Should Be Successful    ${resp}
    ${message}=    Convert To String   ${resp.content}
    Should Contain    ${message}    products