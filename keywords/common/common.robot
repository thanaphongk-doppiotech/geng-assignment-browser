*** Keywords ***
Open doppee shop website
    [Documentation]    Open website doppee shop
    Browser.New browser     headless=${FALSE}
    Browser.New context     viewport=${NONE}
    Browser.New page        url=${doppee_web.url}
