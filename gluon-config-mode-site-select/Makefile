include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-config-mode-site-select
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/gluon-config-mode-site-select
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=UI for changing the node-config
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/gluon-config-mode-site-select/install
	mkdir -p $(1)/lib/gluon/site-select/
	sh create-config.sh
	$(CP) ./files/* $(1)/
	$(CP) $(GLUON_SITEDIR)/extra/* $(1)/lib/gluon/site-select/
endef

$(eval $(call BuildPackage,gluon-config-mode-site-select))
