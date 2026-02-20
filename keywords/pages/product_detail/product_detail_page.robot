*** Keywords ***
Click increase quantity button
    [Documentation]     Click at increase quantity button (+)
    Browser.Click       selector=${product_detail_locator.btn_increase_qty}

Get product price
    [Documentation]     Get the product price of given product name
    ...                 This keyword removes currency symbols, commas, space from product price
    ...                 Returns:
    ...                     -   ${product_price}    (number):   The amount of product price (e.g., 1000.00)
    ${product_price_text}    Browser.Get text    ${product_detail_locator.lbl_product_price}
    ${product_price_formatted}    common.Format baht currency to number    currency_text=${product_price_text}
    ${product_price}    BuiltIn.Convert to number    item=${product_price_formatted}
    RETURN      ${product_price}

Get product quantity
    [Documentation]     Get current product quantity amount
    ...                 Returns:
    ...                     -   ${quantity}     (number)    :   The amount of product quantity (e.g., 5)
    ${quantity}     Browser.Get text    selector=${product_detail_locator.txt_quantity}
    RETURN      ${quantity}

Select product color by color name
    [Documentation]     Select dropdown color as value equal to color name
    ...                 Arguments:
    ...                     -   ${color_name}   (string)    :   The color name to be selected (e.g., White)
    [Arguments]     ${color_name}
    Browser.Select options by    ${product_detail_locator.ddl_color}        text                    ${color_name}

Click add to cart button
    [Documentation]     Click at add to cart button
    Browser.Click       selector=${product_detail_locator.btn_add_to_cart}
