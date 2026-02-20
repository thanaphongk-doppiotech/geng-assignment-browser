*** Settings ***
Library    Browser
Library    DebugLibrary
Library    String

# pages
Resource    ${CURDIR}/../keywords/pages/popup/popup_page.robot
Resource    ${CURDIR}/../keywords/pages/login/login_page.robot

# locators
Resource    ${CURDIR}/locators/popup/popup_locator.robot
Resource    ${CURDIR}/locators/login/login_locator.robot

# settings
Variables   ${CURDIR}/settings/settings.yaml

# common
Resource    ${CURDIR}/../keywords/common/common.robot

# translation
Variables   ${CURDIR}/translation/${LANG.lower()}.yaml
