

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ProjectType List</title>
    </head>
    <body>
    <div class="wrapper">
        <div class="body">
            <h1>ProjectType List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="type" title="Type" />
                        
                        	<g:sortableColumn property="activeYesNo" title="Active" />
                   	        
                   	        <th>Edit</th>
                        
                   	        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${projectTypeInstanceList}" status="i" var="projectTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${i+1}</td>
                        
                            <td>${fieldValue(bean:projectTypeInstance, field:'type')}</td>
                        	 
                        	 <td>
                	             <g:if test="${fieldValue(bean:projectTypeInstance, field:'activeYesNo') == 'Y'}">
    							 ${'YES'}
    							 </g:if>
    							 <g:else>
    							 ${'NO'}
    							 </g:else>
                        	 </td>
                            <td><g:link action="edit" id="${projectTypeInstance.id}">Edit</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
           <div class="paginateButtons">
                <g:paginate total="${ProjectType.count()}" />
            </div> 
        </div>
        </div>
    </body>
</html>
