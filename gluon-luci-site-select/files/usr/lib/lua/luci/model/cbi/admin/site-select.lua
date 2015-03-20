local f, s, o
local uci = luci.model.uci.cursor()
local site = require 'gluon.site_config'
local fs = require "nixio.fs"

local sites = {}

uci:foreach('siteselect', 'site',
function(s)
	table.insert(sites, s['.name'])
end
)

--set the heading, button and stuff
f = SimpleForm("site-select", "Community-Einstellungen auswählen")
f.reset = false

f.template = "admin/expertmode"
f.submit = "Speichern"

-- text, which describes what the package does to the user
s = f:section(SimpleSection, nil, [[
Hier hast du die Möglichkeit die Community, mit der sich dein
Knoten verbindet, auszuwählen. Bitte denke daran, dass dein Router
sich dann nur mit dem Netz der ausgewählten Community verbindet.
]])

o = s:option(ListValue, "community", "Community")
o:value(site.site_code, site.site_name)

for index, site in ipairs(sites) do
	o:value(site, uci:get('siteselect', site, 'sitename'))
end

function f.handle(self, state, data)
	if state == FORM_VALID then

		uci:set('siteselect', site.site_code, "secret", uci:get('fastd', 'mesh_vpn', 'secret'))
		uci:save('siteselect')
		uci:commit('siteselect')

		uci:delete('fastd', 'mesh_vpn', 'secret')

		local secret = uci:get('siteselect', data.community, 'secret')
		
		if not secret or not secret:match(("%x"):rep(64)) then
			uci:delete('siteselect', data.community, 'secret')
		else
			uci:set('fastd', 'mesh_vpn', "secret", secret)
		end
				
		uci:save('fastd')
		uci:commit('fastd')

		fs.copy(uci:get('siteselect', data.community , 'path'), '/lib/gluon/site.conf')
		
		os.execute('sh "/lib/gluon/site-upgrade"')
	end
end

return f