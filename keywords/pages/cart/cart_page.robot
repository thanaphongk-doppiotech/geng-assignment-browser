*** Keywords ***
Verify product name is in cart
    [Documentation]     Verify product name is in cart
    ...                 Arguments:
    ...                     -   ${product_name} (string)    :   product name to be verify (e.g., Keyboard)
    [Arguments]     ${product_name}
    ${locator}      String.Replace string    string=${cart_locator.lbl_product_name_by_name}        search_for=***string***    replace_with=${product_name}
    Browser.Highlight elements    selector=${locator}

Verify product quantity of product is correct
    [Documentation]     Verify product quantity of given product name is matches
    ...                 Arguments:
    ...                     -   ${product_name} (string)    :   product name to be verify (e.g., Keyboard)
    ...                     -   ${product_qty}  (string)    :   product qty to be verify (e.g., 5)
    [Arguments]     ${product_name}     ${product_qty}
    ${locator}      String.Replace string    string=${cart_locator.lbl_product_quantity_by_name_and_qty}            search_for=***string***    replace_with=${product_name}
    ${locator}      String.Replace string    string=${locator}      search_for=***number***    replace_with='${product_qty}'
    Browser.Highlight elements    selector=${locator}

Verify product price of product is correct
    [Documentation]     Verify product price of given product name is matches
    ...                 Arguments:
    ...                     -   ${product_name}     (string)    :   product name to be verify (e.g., Keyboard)
    ...                     -   ${product_price}    (string)    :   product price to be verify (e.g., 5,000)
    [Arguments]     ${product_name}     ${product_price}
    ${locator}      String.Replace string    string=${cart_locator.lbl_product_total_price_by_name_and_total_amount}                search_for=***string***    replace_with=${product_name}
    ${locator}      String.Replace string    string=${locator}      search_for=***number***    replace_with='${product_price}'
    Browser.Highlight elements    selector=${locator}
