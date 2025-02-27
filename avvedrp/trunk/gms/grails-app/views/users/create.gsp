

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Users</title>         
    </head>
    <body>
    <div class="wrapper">
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
              <span class="menuButton"><g:link url="[action:'create',controller:'userMap']">Project User Map</g:link></a></span>
            <span class="menuButton"><g:link class="list" action="Create">Users List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Users</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usersInstance}">
            <div class="errors">
                <g:renderErrors bean="${usersInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userName">User Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'userName','errors')}">
                                    <input type="text" id="userName" name="userName" value="${fieldValue(bean:usersInstance,field:'userName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userPassword">User Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'userPassword','errors')}">
                                    <input type="text" id="userPassword" name="userPassword" value="${fieldValue(bean:usersInstance,field:'userPassword')}"/>
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:usersInstance,field:'name')}"/>
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:usersInstance,field:'email')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone">Phone:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'phone','errors')}">
                                    <input type="text" id="phone" name="phone" value="${fieldValue(bean:usersInstance,field:'phone')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="role">Role:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'role','errors')}">
                                    <g:select name="role" from="${['Admin', 'Grant Manager','Project Manager']}" value="${fieldValue(bean:usersInstance,field:'role')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="activeYesNo">Active Yes No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'activeYesNo','errors')}">
                                	<g:select name="activeYesNo" from="${['Y', 'N']}" value="${fieldValue(bean:usersInstance,field:'activeYesNo')}" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
            </div>
    </body>
</html>
