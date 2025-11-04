SUMMARY = "WPE bolt image"

inherit base-bolt-image

IMAGE_INSTALL += "cog-launcher"
IMAGE_INSTALL += "liberation-fonts"
IMAGE_INSTALL += "wpe-backend-rdk-platform-plugin"
IMAGE_INSTALL += "glib-networking"
IMAGE_INSTALL += "ca-certificates"
IMAGE_INSTALL += "ca-certificates-trust-store"
