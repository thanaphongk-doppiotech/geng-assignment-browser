*** Keywords ***
Input username
    [Documentation]     Fill the username into username field
    ...                 Arguments:
    ...                     -   ${username} (string): The username to be enter (e.g., Doppio)
    [Arguments]     ${username}
    Browser.Fill text       selector=${login_locator.txt_username}    txt=${username}

Input password
    [Documentation]     Fill the password into password field
    ...                 Arguments:
    ...                     -   ${password} (string): The password to be enter (e.g., Doppio123*)
    [Arguments]     ${password}
    Browser.Fill text       selector=${login_locator.txt_password}    txt=${password}

Select remember me checkbox
    [Documentation]     Click to select the remember be checkbox
    Browser.Check checkbox    selector=${login_locator.chk_remember}

Click login button
    [Documentation]     Click at login button
    Browser.Click       selector=${login_locator.btn_login}
