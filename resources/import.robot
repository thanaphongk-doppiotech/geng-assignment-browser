*** Settings ***
Library         Browser
Library         DebugLibrary
Library         String

# pages
Resource        ${CURDIR}/../keywords/pages/popup/popup_page.robot
Resource        ${CURDIR}/../keywords/pages/top_navigation/top_navigation_page.robot
Resource        ${CURDIR}/../keywords/pages/login/login_page.robot
Resource        ${CURDIR}/../keywords/pages/product_list/product_list_page.robot
Resource        ${CURDIR}/../keywords/pages/product_detail/product_detail_page.robot
Resource        ${CURDIR}/../keywords/pages/cart/cart_page.robot

# features
Resource        ${CURDIR}/../keywords/features/product_detail/product_detail_feature.robot

# locators
Resource        ${CURDIR}/locators/popup/popup_locator.robot
Resource        ${CURDIR}/locators/top_navigation/top_navigation_locator.robot
Resource        ${CURDIR}/locators/login/login_locator.robot
Resource        ${CURDIR}/locators/product_list/product_list_locator.robot
Resource        ${CURDIR}/locators/product_detail/product_detail_locator.robot
Resource        ${CURDIR}/locators/cart/cart_locator.robot

# settings
Variables       ${CURDIR}/settings/settings.yaml

# common
Resource        ${CURDIR}/../keywords/common/common.robot

# translation
Variables       ${CURDIR}/translation/${LANG.lower()}.yaml
