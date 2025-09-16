# Inherit mobile full common hertzify stuff
$(call inherit-product, vendor/hertzify/config/common_mobile_full.mk)

# Inherit tablet common hertzify stuff
$(call inherit-product, vendor/hertzify/config/tablet.mk)

$(call inherit-product, vendor/hertzify/config/telephony.mk)
