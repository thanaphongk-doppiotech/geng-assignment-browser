*** Variables ***
${cart_locator.lbl_product_name_by_name}                            css=.cart-body .cname:has-text("***string***")
${cart_locator.lbl_product_quantity_by_name_and_qty}                css=.cart-body .cname:has-text("***string***") ~ .cqty:has-text("***number***")
${cart_locator.lbl_product_total_price_by_name_and_total_amount}    css=.cart-body .cname:has-text("***string***") ~ .csum:has-text("***number***")
