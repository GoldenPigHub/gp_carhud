fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'QBR HUD'
version '1.0.0'

ui_page {
	'html/index.html',
}

files {
	'html/css/*.css',
	'html/js/*.js',
	'html/index.html',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

shared_scripts {
	'config.lua',
}

escrow_ignore {
	'html/css/*.css',
	'html/js/*.js',
	'html/index.html',
	'client/*.lua',
	'server/*.lua',
	'config.lua',
}

lua54 'yes'