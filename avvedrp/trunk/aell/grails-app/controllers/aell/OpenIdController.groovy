package aell
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.openid.OpenIdAuthenticationFailureHandler as OIAFH

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.AuthenticationException
import org.springframework.security.web.savedrequest.DefaultSavedRequest

import aell.AvlUserMaster
import aell.AvlRoleMaster
import aell.AvlRoleUserRel

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.context.SecurityContextHolder as SCH


/**
 * Manages associating OpenIDs with application users, both by creating a new local user
 * associated with an OpenID and also by associating a new OpenID to an existing account.
 */
class OpenIdController {
	def LoginService
	/** Dependency injection for daoAuthenticationProvider. */
	def daoAuthenticationProvider

	/** Dependency injection for OpenIDAuthenticationFilter. */
	def openIDAuthenticationFilter

	/** Dependency injection for the springSecurityService. */
	def springSecurityService

	static defaultAction = 'auth'

	/**
	 * Shows the login page. The user has the choice between using an OpenID and a username
	 * and password for a local account. If an OpenID authentication is successful but there
	 * is no corresponding local account, they'll be redirected to createAccount to create
	 * a new account, or click through to linkAccount to associate the OpenID with an
	 * existing local account.
	 */
	def auth = {
		//println "here openidcontroller "
		session.login_flag = 'openId'
		def hostname=request.getScheme() + "://" + request.getServerName() +":"+ request.getServerPort() + request.getContextPath()
		//println "hostname "+hostname
		def config = SpringSecurityUtils.securityConfig
		if (springSecurityService.isLoggedIn()) {
			def user=SCH.context.authentication.principal.username
			def sessionid=request.getSession().id
			def ipaddress=request.getRemoteAddr()
			def userInstance=LoginService.saveUserDetails(user,sessionid,ipaddress)
			session.Username=user;
			session.user = userInstance;
			session.sessionid=sessionid;
			if(userInstance){
        	 redirect(url:hostname+'/home/index?pg=main')
			return 
			}
		}
		//println "${request.contextPath}$openIDAuthenticationFilter.filterProcessesUrl"
		
		/*String view = 'auth'
		String openIdPostUrl = "${request.contextPath}$openIDAuthenticationFilter.filterProcessesUrl"
		render view: view, model: [openIdPostUrl: openIdPostUrl,persistentRememberMe: config.rememberMe.persistent,
								   rememberMeParameter: config.rememberMe.parameter,hostname:hostname]*/
		String view = 'auth'
		[openIdPostUrl: "${request.contextPath}$openIDAuthenticationFilter.filterProcessesUrl",
		 daoPostUrl:    "${request.contextPath}${config.apf.filterProcessesUrl}",
		 persistentRememberMe: config.rememberMe.persistent,
		 rememberMeParameter: config.rememberMe.parameter,
		 openidIdentifier: config.openid.claimedIdentityFieldName,hostname:hostname]
		
	}

	/**
	 * Initially we're redirected here after a UserNotFoundException with a valid OpenID
	 * authentication. This action is specified by the openid.registration.createAccountUri
	 * attribute.
	 * <p/>
	 * The GSP displays the OpenID that was received by the external provider and keeps it
	 * in the session rather than passing it between submits so the user has no opportunity
	 * to change it.
	 */
	def createAccount = {  
		def hostname=request.getScheme() + "://" + request.getServerName() +":"+ request.getServerPort() + request.getContextPath()
		String openId = session[OIAFH.LAST_OPENID_USERNAME]
		//println "here openidcontroller createAccount "+openId
		if (!openId) {
      flash.error = 'Sorry, an OpenID was not found'
	   //println "here openidcontroller createAccount flash error"
	  // println config.failureHandler.defaultFailureUrl
      redirect uri: config.failureHandler.defaultFailureUrl
      return
		}   
		def user = new GrailsUser(openId, 'password', true, true,
         true, true, [new GrantedAuthorityImpl('ROLE_OPENID')], 0) 
		SCH.context.authentication = new UsernamePasswordAuthenticationToken(
         user, 'password', user.authorities)  
		session.removeAttribute OIAFH.LAST_OPENID_USERNAME
		session.removeAttribute OIAFH.LAST_OPENID_ATTRIBUTES   
		def config = SpringSecurityUtils.securityConfig  
		/*def savedRequest = session[DefaultSavedRequest.SPRING_SECURITY_SAVED_REQUEST_KEY]
		println "here openidcontroller createAccount savedRequest"+savedRequest
		if (savedRequest && !config.successHandler.alwaysUseDefault) {

			redirect url: savedRequest.redirectUrl
		}
		else {
			redirect uri: config.successHandler.defaultTargetUrl
		}*/
		
		def university = grailsApplication.config.newuser_university
		//println "university session--"+university
		def sessionid=request.getSession().id
		def ipaddress=request.getRemoteAddr()
		def createuserInstance=LoginService.createUserDetails(openId,user.password,'ROLE_OPENID',sessionid,ipaddress,university)
		session.Username=openId;
		session.user = createuserInstance;
		session.sessionid=sessionid;
		if(createuserInstance){
		  redirect(url:hostname+'/home/index?pg=main')
		//return
		}
		
		
	}


	/**
	 * The registration page has a link to this action so an existing user who successfully
	 * authenticated with an OpenID can associate it with their account for future logins.
	 */
	def linkAccount = { OpenIdLinkAccountCommand command ->

		String openId = session[OIAFH.LAST_OPENID_USERNAME]
		if (!openId) {
			flash.error = 'Sorry, an OpenID was not found'
			return [command: command]
		}

		if (!request.post) {
			// show the form
			command.clearErrors()
			return [command: command, openId: openId]
		}

		if (command.hasErrors()) {
			return [command: command, openId: openId]
		}

		try {
			registerAccountOpenId command.username, command.password, openId
		}
		catch (AuthenticationException e) {
			flash.error = 'Sorry, no user was found with that username and password'
			return [command: command, openId: openId]
		}

		authenticateAndRedirect command.username
	}

	/**
	 * Authenticate the user for real now that the account exists/is linked and redirect
	 * to the originally-requested uri if there's a SavedRequest.
	 *
	 * @param username the user's login name
	 */
	private void authenticateAndRedirect(String username) {
		session.removeAttribute OIAFH.LAST_OPENID_USERNAME
		session.removeAttribute OIAFH.LAST_OPENID_ATTRIBUTES

		springSecurityService.reauthenticate username

		def config = SpringSecurityUtils.securityConfig

		def savedRequest = session[DefaultSavedRequest.SPRING_SECURITY_SAVED_REQUEST_KEY]
		if (savedRequest && !config.successHandler.alwaysUseDefault) {
			redirect url: savedRequest.redirectUrl
		}
		else {
			redirect uri: config.successHandler.defaultTargetUrl
		}
	}

	/**
	 * Create the user instance and grant any roles that are specified in the config
	 * for new users.
	 * @param username  the username
	 * @param password  the password
	 * @param openId  the associated OpenID
	 * @return  true if successful
	 */
	private boolean createNewAccount(String username, String password, String openId) {
		boolean created = User.withTransaction { status ->
			def config = SpringSecurityUtils.securityConfig

			password = springSecurityService.encodePassword(password)
			def user = new AvlUserMaster(username: username, password: password, enabled: true)

			user.addToOpenIds(url: openId)

			if (!user.save()) {
				return false
			}

			for (roleName in config.openid.registration.roleNames) {
				AvlRoleUserRel.create user, AvlRoleMaster.findByAuthority(roleName)
			}
			return true
		}
		return created
	}

	/**
	 * Associates an OpenID with an existing account. Needs the user's password to ensure
	 * that the user owns that account, and authenticates to verify before linking.
	 * @param username  the username
	 * @param password  the password
	 * @param openId  the associated OpenID
	 */
	private void registerAccountOpenId(String username, String password, String openId) {
		// check that the user exists, password is valid, etc. - doesn't actually log in or log out,
		// just checks that user exists, password is valid, account not locked, etc.
		daoAuthenticationProvider.authenticate(
				new UsernamePasswordAuthenticationToken(username, password))

		User.withTransaction { status ->
			def user = User.findByUsername(username)
			user.addToOpenIds(url: openId)
			if (!user.validate()) {
				status.setRollbackOnly()
			}
		}
	}

	/**
	 * For the initial form display, copy any registered AX values into the command.
	 * @param command  the command
	 */
	private void copyFromAttributeExchange(OpenIdRegisterCommand command) {
		List attributes = session[OIAFH.LAST_OPENID_ATTRIBUTES] ?: []
		for (attribute in attributes) {
			// TODO document
			String name = attribute.name
			if (command.hasProperty(name)) {
				command."$name" = attribute.values[0]
			}
		}
	}
}

class OpenIdRegisterCommand {

	String username = ""
	String password = ""
	String password2 = ""

	static constraints = {
		username blank: false, validator: { String username, command ->
			User.withNewSession { session ->
				if (username && User.countByUsername(username)) {
					return 'openIdRegisterCommand.username.error.unique'
				}
			}
		}
		password blank: false, minSize: 8, maxSize: 64, validator: { password, command ->
			if (command.username && command.username.equals(password)) {
				return 'openIdRegisterCommand.password.error.username'
			}

			if (password && password.length() >= 8 && password.length() <= 64 &&
					(!password.matches('^.*\\p{Alpha}.*$') ||
					!password.matches('^.*\\p{Digit}.*$') ||
					!password.matches('^.*[!@#$%^&].*$'))) {
				return 'openIdRegisterCommand.password.error.strength'
			}
		}
		password2 validator: { password2, command ->
			if (command.password != password2) {
				return 'openIdRegisterCommand.password2.error.mismatch'
			}
		}
	}
}

class OpenIdLinkAccountCommand {

	String username = ""
	String password = ""

	static constraints = {
		username blank: false
		password blank: false
	}
}
