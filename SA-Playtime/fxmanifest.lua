fx_version 'cerulean'
game 'gta5'

description 'San Andreas - PlayTime'
author "Dragodast"
version '1.0.0'

shared_scripts {
	'config.lua',
    '@qb-core/shared/locale.lua',
    'locale/cs.lua' --Here change your locale locale/en.lua for example
}

server_scripts {
    "server/server.lua"
}

lua54 'yes'