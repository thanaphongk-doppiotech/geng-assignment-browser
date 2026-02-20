*** Keywords ***
Verify popup display with message
    [Documentation]     Verify that a popup appears containing the specific text.
    ...                 This keyword dynamically replaces the placeholder `***string***` in the locator with the given `${message}`.
    ...                 Arguments:
    ...                     - ${message}    (string):   The text expected to appear on the popup (e.g., Login Successful!).
    ...                     - ${timeout}    (integer):  The maximum time in second to wait for the popup to appear (e.g., 5s default is 10s).
    [Arguments]     ${message}      ${timeout}=${doppee_web.default_timeout}
    ${locator}      String.Replace string    string=${popup_locator.txt_popup_message}              search_for=***string***    replace_with=${message}
    Browser.Wait for elements state                 selector=${locator}             state=visible    timeout=${timeout}
