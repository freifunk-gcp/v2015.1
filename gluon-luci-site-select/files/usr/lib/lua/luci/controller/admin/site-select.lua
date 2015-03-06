module("luci.controller.admin.site-select", package.seeall)

function index()
	entry({"admin", "site-select"}, cbi("admin/site-select"), "Community", 20)
end
