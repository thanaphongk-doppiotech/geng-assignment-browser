*** Settings ***
Resource        ${CURDIR}/../../resources/import.robot
Variables       ${CURDIR}/../../resources/testdata/TC_ASM_BROWSER_004.yaml

*** Test Cases ***
TC_ASM_BROWSER_004 - Verify user can add product to cart successfully
    [Documentation]    author: Thanaphong Khaownual
    ...                Verify user can add product to cart successfully
    [Tags]      type:training       category:browser
    # Open file doppee_shop.html
    common.Open doppee shop website
    # Input product name in search bar
    top_navigation_page.Click product list menu
    product_list_page.Input search by product name    product_name=${TC_ASM_BROWSER_004.product.name}
    # Click search button
    product_list_page.Click search button
    # Click view button on product
    product_list_page.Click view button by product name    product_name=${TC_ASM_BROWSER_004.product.name}
    # Increase product quantity
    product_detail_feature.Click increase quantity button to add product by number    number=${TC_ASM_BROWSER_004.product.qty}
    # Select color
    product_detail_page.Select product color by color name    color_name=${TC_ASM_BROWSER_004.product.color}
    # Get product price
    ${product_price}    product_detail_page.Get product price
    # Click add to cart button
    product_detail_page.Click add to cart button
    # Verify “Added to cart successfully” popup is displayed
    popup_page.Verify popup display with message    message=${translation.login_page.add_to_cart_success_msg}
    # Click cart button
    top_navigation_page.Click cart menu
    # Verify product name is displayed in cart page (Keyboard)
    cart_page.Verify product name is in cart    product_name=${TC_ASM_BROWSER_004.product.name}
    # Verify product quantity is displayed correctly (5)
    cart_page.Verify product quantity of product is correct     product_name=${TC_ASM_BROWSER_004.product.name}    product_qty=${TC_ASM_BROWSER_004.product.qty}
    # Verify product total price is displayed correctly (9450.00)
    ${actual_total_price}    BuiltIn.Evaluate    ${product_price} * ${TC_ASM_BROWSER_004.product.qty}
    ${actual_totol_price_currency_format}                       common.Format number to baht currecy without comma    number=${actual_total_price}
    cart_page.Verify product price of product is correct        product_name=${TC_ASM_BROWSER_004.product.name}    product_price=${actual_totol_price_currency_format}
