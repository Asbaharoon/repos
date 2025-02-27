import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.openid.OpenIdAuthenticationFailureHandler as OIAFH

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.AuthenticationException
import org.springframework.security.web.savedrequest.DefaultSavedRequest
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsHttpSession
import org.iitk.brihaspati.modules.utils.security.ReadNWriteInTxt
import org.iitk.brihaspati.modules.utils.security.EncrptDecrpt
import org.apache.commons.lang.StringUtils
import org.iitk.brihaspati.modules.utils.security.RemoteAuth



//import Authority
//import UserRole
//import Person
/**
 * Manages associating OpenIDs with application users, both by creating a new local user
 * associated with an OpenID and also by associating a new OpenID to an existing account.
 */
class OpenIdController {

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

            println params.encd
                  println params.rand
                  println params.hash
                 if(params.rand!=null)
                  {
                  String hdir=System.getProperty("user.home");
                  String path=hdir+"/remote_auth/brihaspati3-remote-access.properties";
                  String line=ReadNWriteInTxt.readLin(path,"avv_gms");
                  String skey=StringUtils.substringBetween(line,";",";");
                  String serverurl=StringUtils.substringAfterLast(line,";");
                   String enUrl=EncrptDecrpt.decrypt(params.encd, "avv_gms")
		   println enUrl.split('&');
                    def arr=enUrl.split('&');
                   String UserID=arr[0];
                  
                    println UserID.substring(6,UserID.length())
                    UserID=UserID.substring(6,UserID.length())
                      
                   GrailsHttpSession gh=getSession()
                gh.putValue("UserLogin",UserID) 
                 def user=Person.find("from Person U where U.username='"+UserID+"'");
        if(user)
           {
                    def userMap=UserMap.find("from UserMap UM where UM.user.id="+user.id);
			 gh.putValue("UserId", userMap.user.id);
			 def PartyID=userMap.party.id
			 gh.putValue("Party", PartyID);
		     gh.putValue("Help","Project_List.htm")
	         gh.putValue("PartyID","('"+ PartyID.toString()+"')");
	         redirect uri:'/grantAllocation/gmsFrame'
	         gh.putValue("LoggedIn",params.controller)   
                   

}
                    
                  
                                       
                          }
 
                
		def config = SpringSecurityUtils.securityConfig
		GrailsHttpSession gh=getSession()
		 if(params.lang!=null)
		 {
			gh.putValue("lang",params.lang) 
			 if(params.lang!="ar")
			 {
				gh.putValue("orientation","ltr")
			 }
			 else
			 {
			 	gh.putValue("orientation","rtl")
			 }
		 }
		 else
		 {
			 if(gh.getValue("lang")==null)
			 {
				 gh.putValue("lang","en")
			 }
		}
		println"..session.main..."+gh.getValue("lang")
		if (springSecurityService.isLoggedIn()) {
			redirect uri: config.successHandler.defaultTargetUrl
			return
		}

		[openIdPostUrl: "${request.contextPath}$openIDAuthenticationFilter.filterProcessesUrl",
		 daoPostUrl:    "${request.contextPath}${config.apf.filterProcessesUrl}",
		 persistentRememberMe: config.rememberMe.persistent,
		 rememberMeParameter: config.rememberMe.parameter,
		 openidIdentifier: config.openid.claimedIdentityFieldName, css:gh.getValue("main")]
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
	def createAccount = { OpenIdRegisterCommand command ->

		String openId = session[OIAFH.LAST_OPENID_USERNAME]
		if (!openId) {
			flash.error = 'Sorry, an OpenID was not found'
			return [command: command]
		}

		if (!request.post) {
			// show the form
			command.clearErrors()
			copyFromAttributeExchange command
			return [command: command, openId: openId]
		}

		if (command.hasErrors()) {
			return [command: command, openId: openId]
		}

		if (!createNewAccount(command.username, command.password, openId)) {
			return [command: command, openId: openId]
		}

		authenticateAndRedirect command.username
	}

        

   		def brihaspatiLogin =
	{

           
	
	}

           	def register =
	{

           String Email=request.getParameter("email");
            String server=request.getLocalAddr()
            String port=request.getServerPort();

System.out.print(Email);

String returnurl=" http://"+server+":"+port+"/gms/login/auth";


String resp=RemoteAuth.AuthR(Email,returnurl,"avv_gms");
response.sendRedirect(resp);
	
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
		boolean created = Person.withTransaction { status ->
			def config = SpringSecurityUtils.securityConfig

			password = springSecurityService.encodePassword(password)
			def user = new Person(username: username, password: password, enabled: true)

			user.addToOpenIds(url: openId)

			if (!user.save()) {
				return false
			}

			for (roleName in config.openid.registration.roleNames) {
				UserRole.create user, Authority.findByAuthority(roleName)
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

		Person.withTransaction { status ->
			def user = Person.findByUsername(username)
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
	
	   def institutionsList =
	{
	  
	  	GrailsHttpSession gh=getSession()
		def userService = new UserService()
		def dataSecurityService = new DataSecurityService()
		def partyService = new PartyService()
		
		def activepartyInstanceList
		def userInstance
		activepartyInstanceList = partyService.getAllActiveParties()
		for(int i=0;i<activepartyInstanceList.size();i++)
		{
		   userInstance = userService.getSuperAdminUsingPartyId(activepartyInstanceList[i].id)
		     if(userInstance)
		     	activepartyInstanceList.remove(activepartyInstanceList[i]);
		}
		
		
		[ activepartyInstanceList:activepartyInstanceList ] 
	  		
	}
	
	def sendMessage =
	{

	 def partyService = new PartyService()
	 def userService = new UserService()
	 def partyInstance = partyService.getPartyBasedOnId(new Integer(params.id))
  	 def userInstance = userService.getSiteAdminUsingPartyId(partyInstance[0].id)
	 def personInstance = Person.find("from Person P where P.id="+userInstance[0])

		[personInstance:personInstance]
	}
	
	def sendMessageToSiteAdmin =
	{
		
		def notificationsEmailsService = new NotificationsEmailsService()
		def partyService = new PartyService()	    	
    	//mail content
        String mailMessage="";
        mailMessage=params.message;
		mailMessage= mailMessage.replaceAll( "</?p[^>]*>", "" );
			       
	    def emailId = notificationsEmailsService.sendEmailToSiteAdmin(params.toEmail,params.fromEmail,mailMessage,params.subject,"text/plain")
	      if(emailId){
			def activepartyInstanceList = partyService.getAllActiveParties()
	      flash.message = "${message(code: 'default.Institution.MessageConfirmation.label')}"	
	      render(view: "institutionsList", model: [activepartyInstanceList: activepartyInstanceList])
	      
	     
	      }
	
	}
	
	
}

class OpenIdRegisterCommand {

	String username = ""
	String password = ""
	String password2 = ""

	static constraints = {
		username blank: false, validator: { String username, command ->
			Person.withNewSession { session ->
				if (username && Person.countByUsername(username)) {
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
