*** Settings ***
Library     Browser
Library     DebugLibrary

*** Keywords ***
Open training html file
    [Documentation]    Open html file
    Browser.New browser     headless=${FALSE}
    Browser.New context     viewport=${NONE}
    Browser.New page        url=file://${CURDIR}/../../../${local_html_file_name}

*** Variables ***
${local_html_file_name}             training.html
${locator.txt_username}             css=input#username    # # = id
${locator.txt_email}                css=.input-box[name="email"]    # . = class, [] = attribute, concate both together = and
${locator.txt_password}             css=[placeholder*="Enter password"]    # *= contains, ^= starts with, $= ends with
${locator.btn_login}                css=button:text-is("Login")
${locator.popup_message}            css=div.popup-box > p#popup-message:has-text("Login Successful!")    # > = direct child, + = next sibling, ~ = following sibling
${locator.ddl_country}              css=select#country.input-box
${locator.opt_value_th}             th
${locator.opt_label_th}             Thailand
${locator.opt_index_th}             1
${locator.chk_agree_terms}          css=label:has-text("I agree to the terms") > input
${locator.chk_subscribe_news}       css=label:has-text("Subscribe to newsletter") > input
${locator.btn_show_secret_text}     css=#show-btn.btn
${locator.lbl_secret_text}          css=p:has-text("Secret Revealed!")
${locator.list_item}                css=ul#item-list > li
${locator.lbl_item_a}               css=ul#item-list li:has-text("Item A")
${locator.lbl_item_b}               css=ul#item-list li.item special
${locator.lbl_item_c}               css=ul#item-list li.item:has-text("Item C")
${locator.lbl_item_d}               css=ul#item-list li:text-is("Item D")

*** Test Cases ***
TC_ASM_BROWSER_001 - Verify user registration form and interactive UI components
    [Documentation]    Author : Thanaphong Khaownual
    ...                Verify user registration form and interactive UI components
    [Tags]      type:training       category:browser
    # 1. Open html file training.html
    Open training html file
    # 2. Fill text in username, email , password
    Browser.Fill text       selector=${locator.txt_username}    txt=doppio
    Browser.Fill text       selector=${locator.txt_email}    txt=browser_training@doppio.com
    Browser.Fill text       selector=${locator.txt_password}    txt=doppio123*
    # 3. Click login button and verify that popup message “Login Successful!” is displayed
    Browser.Click           selector=${locator.btn_login}
    Browser.Highlight elements    selector=${locator.popup_message}
    Browser.Wait for elements state    selector=${locator.popup_message}    state=hidden
    # 4. Chose country “Thailand”
    Browser.Select options by    ${locator.ddl_country}    label            ${locator.opt_label_th}
    # 5. Check checkbox “I agree to the terms” / “Subscribe to newsletter” and then uncheck
    Browser.Check checkbox    selector=${locator.chk_agree_terms}
    Browser.Check checkbox    selector=${locator.chk_subscribe_news}
    Browser.Uncheck checkbox    selector=${locator.chk_agree_terms}
    Browser.Uncheck checkbox    selector=${locator.chk_subscribe_news}
    # 6. Click “Show Secret Text” button and verify that secret text is displayed
    Browser.Click           selector=${locator.btn_show_secret_text}
    Browser.Hover           selector=${locator.lbl_item_d}
    Browser.Highlight elements    selector=${locator.lbl_secret_text}
    # 7. Get secret text and log in console
    ${secret_text}=         Browser.Get text        selector=${locator.lbl_secret_text}
    BuiltIn.Log to console    message=Secret text = '${secret_text}'
    # 8. Get element count of item list and log number in console
    ${items}=               Browser.Get elements    selector=${locator.list_item}
    ${items_count}=         BuiltIn.Get length      ${items}
    # 9. Get item name “Item C” using nth locator and log name in console
    ${lbl_item_c}=          Browser.Get text        selector=${items[2]}
    BuiltIn.Log to console    message=${lbl_item_c}
    # 10. Press key “Control+A” and “Delete” to remove text in email field
    Browser.Press keys      ${locator.txt_email}    Meta+A                  Delete  # MAC = Meta+A, Windows = Control+A
    # 11. Take screenshot and close browser
    Browser.Take screenshot
    Browser.Close browser
