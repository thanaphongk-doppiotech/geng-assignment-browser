*** Keywords ***
Input search by product name
    [Documentation]     Input text into search input field
    ...                 Arguments:
    ...                     -   ${product_name} (string):   The product name to be entered (e.g., keyboard)
    [Arguments]     ${product_name}
    Browser.Fill text       selector=${product_list_locator.txt_search}    txt=${product_name}

Click search button
    [Documentation]     Click at search button
    Browser.Click       selector=${product_list_locator.btn_search}

Click view button by product name
    [Documentation]     Click view button of product name
    ...                 Arguments:
    ...                     -   ${product_name} (string):   The product name that need to be click view button (e.g., keyboard)
    [Arguments]     ${product_name}
    ${locator}          String.Replace string    string=${product_list_locator.btn_view_by_product_name}                search_for=***string***    replace_with=${product_name}
    Browser.Click       selector=${locator}