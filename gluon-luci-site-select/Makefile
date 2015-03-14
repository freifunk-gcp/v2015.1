include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-luci-site-select
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/gluon-luci-site-select
  SECTION:=gluon
  CATEGORY:=Gluon
  DEPENDS:=+gluon-luci-admin
  TITLE:=UI for changing the node-config
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/gluon-luci-site-select/install
	mkdir -p $(1)/etc/config/
	mkdir -p $(1)/lib/gluon/site-select/
	$(CP) ./files/* $(1)/
	$(CP) $(GLUON_SITEDIR)/extra/* $(1)/lib/gluon/site-select/
	DIR=$(1) sh create-config.sh
endef

$(eval $(call BuildPackage,gluon-luci-site-select))
