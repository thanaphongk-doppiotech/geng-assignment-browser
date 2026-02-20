*** Settings ***
Library     Browser
Library     DebugLibrary

*** Keywords ***
Open training html file
    [Documentation]    Open html file
    Browser.New browser     headless=${FALSE}
    Browser.New context     viewport=${NONE}
    Browser.New page        url=file://${CURDIR}/../../web_html/${local_html_file_name}

*** Variables ***
${local_html_file_name}             training.html
${locator.txt_username}             css=input#username    # # = id
${locator.txt_email}                css=.input-box[name="email"]    # . = class, [] = attribute, concate both together = and
${locator.txt_password}             css=[placeholder*="Enter password"]    # *= contains, ^= starts with, $= ends with
${locator.btn_login}                css=button:text-is("Login")
${locator.popup_message}            css=div.popup-box > p#popup-message    # > = direct child, + = next sibling, ~ = following sibling
${locator.ddl_country}              css=select#country.input-box
${locator.opt_value_th}             th
${locator.opt_label_th}             Thailand
${locator.opt_index_th}             1
${locator.chk_agree_terms}          css=label:has-text("I agree to the terms") > input
${locator.btn_show_secret_text}     css=#show-btn.btn
${locator.lbl_secret_text}          css=p:has-text("Secret Revealed!")
${locator.lbl_item_a}               css=ul#item-list li:has-text("Item A")
${locator.lbl_item_b}               css=ul#item-list li.item special
${locator.lbl_item_c}               css=ul#item-list li.item:has-text("Item C")
${locator.lbl_item_d}               css=ul#item-list li:text-is("Item D")

*** Test Cases ***
TC_ASM_CSS_001 - Verify user registration form and interactive UI components
    [Documentation]    Author : Thanaphong Khaownual
    ...                Verify user registration form and interactive UI components
    [Tags]      type:training       category:css_locator
    # 1. Open html file training.html
    Open training html file
    # 2. Find following element locators (CSS selector) and store in variable section:
    #     a. Input username / email / password field
    Browser.Fill text       selector=${locator.txt_username}    txt=Doppio
    Browser.Fill text       selector=${locator.txt_email}    txt=browser_training@doppio.com
    Browser.Fill text       selector=${locator.txt_password}    txt=Doppio123*
    #     b. Login button
    Browser.Click           selector=${locator.btn_login}
    #     c. Popup message
    Browser.Wait for elements state    selector=${locator.popup_message}    state=hidden
    #     d. Choose country dropdown
    Browser.Select options by    ${locator.ddl_country}    value            ${locator.opt_value_th}
    #     e. I agree to the terms / Subscribe to newsletter checkbox
    Browser.Check checkbox    selector=${locator.chk_agree_terms}
    #     f. Show Secret Text button
    Browser.Click           selector=${locator.btn_show_secret_text}
    Browser.Hover           selector=${locator.lbl_item_d}
    #     g. Secret text
    Browser.Highlight elements    selector=${locator.lbl_secret_text}
    #     h. Item A, Item B, Item C, Item D
    Browser.Highlight elements    selector=${locator.lbl_item_a}
    Browser.Highlight elements    selector=${locator.lbl_item_b}
    Browser.Highlight elements    selector=${locator.lbl_item_c}
    Browser.Highlight elements    selector=${locator.lbl_item_d}
