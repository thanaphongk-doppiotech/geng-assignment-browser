*** Keywords ***
Click product list menu
    [Documentation]     Click at product list button
    Browser.Click       selector=${top_navigation_locator.btn_product_list}

Click product detail menu
    [Documentation]     Click at product detail button
    Browser.Click       selector=${top_navigation_locator.btn_product_detail}

Click cart menu
    [Documentation]     Click at cart button
    Browser.Click       selector=${top_navigation_locator.btn_cart}
