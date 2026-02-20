*** Keywords ***
Open doppee shop website
    [Documentation]    Open website doppee shop
    Browser.New browser     headless=${FALSE}
    Browser.New context     viewport=${NONE}
    ${url}=                 BuiltIn.Set variable    file://${CURDIR}${doppee_web.file_path}
    Browser.New page        url=${url}

Format baht currency to number
    [Documentation]     Formats a currency string into an integer value
    ...                 This keyword removes currency symbols, commas, space from product price
    ...                 Arguments:
    ...                     - ${currency_text}  (string):   The currency text to be formatted (e.g., ฿1,890.00).
    ...                 Returns:
    ...                     - ${number_value}  (number):   The number that was formatted (e.g., 1890.00)
    [Arguments]     ${currency_text}
    ${cleaned_text}     String.Remove string    ${currency_text}    ฿       ,       ${SPACE}
    ${number_value}     BuiltIn.Convert to number    item=${cleaned_text}
    RETURN          ${number_value}

Format number to baht currecy without comma
    [Documentation]     Formats a numeric value into a currency string format.
    ...                 This keyword rounds the input number to 2 decimal places and prepends
    ...                 the currency symbol (฿).
    ...                 Arguments:
    ...                     - ${number}             (string): The number to be formatted (e.g., 1890.5421).
    ...                     - ${decimal_place}      (number): The amount of decimal place to be formatted (e.g., 4 default is 2).
    ...                 Returns:
    ...                     - ${formatted_number}   (string): The formatted currency string (e.g., ฿1890.54).
    [Arguments]     ${number}               ${decimal_place}=2
    ${formatted_number}=    BuiltIn.Evaluate    "฿{:.${decimal_place}f}".format(float('${number}'))
    RETURN          ${formatted_number}
