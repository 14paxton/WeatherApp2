

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'app.admin.security.User'
grails.plugin.springsecurity.userLookup.usernameIgnoreCase = true
grails.plugin.springsecurity.userLookup.usernamePropertyName = 'email'


grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'app.admin.security.UserRole'
grails.plugin.springsecurity.authority.className = 'app.admin.security.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/activeUser/**',  access: ['permitAll']],
	[pattern: '/adminDashboard/**', access: ['ROLE_ADMIN']],
	[pattern: '/location/**',    access: ['ROLE_USER', 'ROLE_ADMIN']],
	[pattern: '/user/**',        access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/ActiveUser/index'

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

