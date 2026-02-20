*** Settings ***
Library     Browser
Library     DebugLibrary

*** Variables ***
${local_html_file_name}             training.html
${locator.txt_username}             css=input#username    # # = id
${locator.txt_email}                css=.input-box[name="email"]    # . = class, [] = attribute, concate both together = and
${locator.txt_password}             css=[placeholder*="Enter password"]    # *= contains, ^= starts with, $= ends with
${locator.btn_login}                css=button:text-is("Login")
${locator.popup_message}            css=div.popup-box > p#popup-message:has-text("Login Successful!")    # > = direct child, + = next sibling, ~ = following sibling
${locator.ddl_country}              css=select#country.input-box
${locator.chk_agree_terms}          css=label:has-text("I agree to the terms") > input
${locator.chk_subscribe_news}       css=label:has-text("Subscribe to newsletter") > input
${locator.btn_show_secret_text}     css=#show-btn.btn
${locator.lbl_secret_text}          css=p:has-text("Secret Revealed!")
${locator.list_item}                css=ul#item-list > li
${locator.lbl_item_a}               css=ul#item-list li:has-text("Item A")
${locator.lbl_item_b}               css=ul#item-list li.item special
${locator.lbl_item_c}               css=ul#item-list li.item:has-text("Item C")
${locator.lbl_item_d}               css=ul#item-list li:text-is("Item D")

${testdata.username}                doppio
${testdata.email}                   browser_training@doppio.com
${testdata.password}                doppio123*
${testdata.opt_value_th}            th
${testdata.opt_label_th}            Thailand
${testdata.opt_index_th}            1

*** Keywords ***
Open training html file
    [Documentation]    Open html file
    Browser.New browser     headless=${FALSE}       slowMo=0.25
    Browser.New context     viewport=${NONE}
    Browser.New page        url=file://${CURDIR}/../../../${local_html_file_name}

Input username
    [Documentation]    Input username
    [Arguments]     ${username}
    Browser.Fill text       selector=${locator.txt_username}    txt=${username}

Input email
    [Documentation]    Input email
    [Arguments]     ${email}
    Browser.Fill text       selector=${locator.txt_email}    txt=${email}

Input password
    [Documentation]    Input password
    [Arguments]     ${password}
    Browser.Fill text       selector=${locator.txt_password}    txt=${password}

Click login button
    Browser.Click       selector=${locator.btn_login}

Wait until login success popup is hidden
    Browser.Wait for elements state    selector=${locator.popup_message}    state=hidden

Select country dropdown by text
    [Arguments]     ${countryText}
    Browser.Select options by    ${locator.ddl_country}    label            ${countryText}

Check agree terms checkbox
    Browser.Check checkbox    selector=${locator.chk_agree_terms}

Uncheck agree terms checkbox
    Browser.Uncheck checkbox    selector=${locator.chk_agree_terms}

Check subscribe news checkbox
    Browser.Check checkbox    selector=${locator.chk_subscribe_news}

Uncheck subscribe news checkbox
    Browser.Uncheck checkbox    selector=${locator.chk_subscribe_news}

Click show secret text button
    Browser.Click       selector=${locator.btn_show_secret_text}

Get secret text
    ${secret_text}=     Browser.Get text    selector=${locator.lbl_secret_text}
    RETURN      ${secret_text}

Get all items from unordered list
    [Documentation]    Get all item from unordered list (<ul>) element name 'Items'
    ${elements}=    Browser.Get elements    selector=${locator.list_item}
    RETURN      @{elements}

Clear email field by press select all then delete key
    Browser.Press keys      ${locator.txt_email}    Meta+A      Delete  # MAC = Meta+A, Windows = Control+A

*** Test Cases ***
TC_ASM_BROWSER_002 - Verify user registration form and interactive UI components
    [Documentation]    Author : Thanaphong Khaownual
    ...                Verify user registration form and interactive UI components
    [Tags]      type:training       category:css_locator
    # 1. Open html file training.html
    Open training html file
    # 2. Fill text in username, email , password
    Input username          username=${testdata.username}
    Input email             email=${testdata.email}
    Input password          password=${testdata.password}
    # 3. Click login button and verify that popup message “Login Successful!” is displayed
    Click login button
    Browser.Highlight elements    selector=${locator.popup_message}
    Wait until login success popup is hidden
    # 4. Chose country “Thailand”
    Select country dropdown by text    countryText=${testdata.opt_label_th}
    # 5. Check checkbox “I agree to the terms” / “Subscribe to newsletter” and then uncheck
    Check agree terms checkbox
    Check subscribe news checkbox
    Uncheck agree terms checkbox
    Uncheck subscribe news checkbox
    # 6. Click “Show Secret Text” button and verify that secret text is displayed
    Click show secret text button
    Browser.Hover           selector=${locator.lbl_item_d}
    Browser.Highlight elements    selector=${locator.lbl_secret_text}
    # 7. Get secret text and log in console
    ${secret_text}=         Get secret text
    BuiltIn.Log to console    message=Secret text = '${secret_text}'
    # 8. Get element count of item list and log number in console
    ${elements}=            Get all items from unordered list
    ${elements_count}=      BuiltIn.Get length      ${elements}
    # 9. Get item name “Item C” using nth locator and log name in console
    ${lbl_item_c}=          Browser.Get text        selector=${elements[2]}  # elements[2] = css=ul#item-list > li >> nth=2
    BuiltIn.Log to console    message=${lbl_item_c}
    # 10. Press key “Control+A” and “Delete” to remove text in email field
    Clear email field by press select all then delete key
    # 11. Take screenshot and close browser
    Browser.Take screenshot
    Browser.Close browser
    Debug
