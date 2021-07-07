# libsaithrift-dev package
SAITHRIFT_VER = 0.9.4
LIBSAITHRIFT_DEV = libsaithrift-dev_$(SAITHRIFT_VER)_$(CONFIGURED_ARCH).deb
$(LIBSAITHRIFT_DEV)_SRC_PATH = $(SRC_PATH)/sonic-sairedis/SAI
$(LIBSAITHRIFT_DEV)_DEPENDS += $(BFN_LIBTHRIFT) $(BFN_LIBTHRIFT_DEV) \
                               $(BFN_PYTHON_THRIFT) $(BFN_THRIFT_COMPILER)  \
                               $(BFN_SAI)

$(LIBSAITHRIFT_DEV)_RDEPENDS += $(BFN_LIBTHRIFT) $(BFN_SAI)
SONIC_DPKG_DEBS += $(LIBSAITHRIFT_DEV)

PYTHON_SAITHRIFT = python-saithrift_$(SAITHRIFT_VER)_amd64.deb
$(eval $(call add_extra_package,$(LIBSAITHRIFT_DEV),$(PYTHON_SAITHRIFT)))

SAISERVER = saiserver_$(SAITHRIFT_VER)_amd64.deb
$(SAISERVER)_RDEPENDS += $(BFN_LIBTHRIFT) $(BFN_SAI)
$(eval $(call add_extra_package,$(LIBSAITHRIFT_DEV),$(SAISERVER)))

SAISERVER_DBG = saiserver-dbg_$(SAITHRIFT_VER)_amd64.deb
$(SAISERVER_DBG)_RDEPENDS += $(SAISERVER)
$(eval $(call add_extra_package,$(LIBSAITHRIFT_DEV),$(SAISERVER_DBG)))
