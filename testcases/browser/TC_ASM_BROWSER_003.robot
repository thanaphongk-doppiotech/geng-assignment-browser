*** Settings ***
Resource        ${CURDIR}/../../resources/import.robot
Variables       ${CURDIR}/../../resources/testdata/TC_ASM_BROWSER_003.yaml

*** Test Cases ***
TC_ASM_BROWSER_003 - Verify user can login successfully
    [Documentation]    author: Thanaphong Khaownual
    ...                Verify user can login successfully
    [Tags]      type:training       category:browser
    # Open file doppee_shop.html
    common.Open doppee shop website
    # Input username
    login_page.Input username    username=${TC_ASM_BROWSER_003.user.email}
    # Input password
    login_page.Input password    password=${TC_ASM_BROWSER_003.user.password}
    # Check remember me checkbox
    login_page.Select remember me checkbox
    # Click login button
    login_page.Click login button
    # Verify message ‘Login successfully’
    popup_page.Verify popup display with message    message=${translation.login_page.login_success_msg}
