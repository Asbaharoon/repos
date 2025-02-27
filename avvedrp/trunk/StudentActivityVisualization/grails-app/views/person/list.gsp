<meta name="layout" content="main" />	
<!-- ##################################  Layout body starts here  ###########################################-->
	<div id="wrapper">
		<div id="head">
			<div id="logo_user_details">&nbsp;</div>
		<g:if test="${session.ROLE == 'ROLE_SUPERADMIN' || session.ROLE == 'ROLE_ADMIN'}">
		<g:menu/>
		</g:if >
		</div>

	<div id="content"> <!-- Start of content div -->
<!-- Middle area starts here -->
		<br />
       <div align="center"><h3>&nbsp;&nbsp;&nbsp;Users List</h3></div>
		<div align="right" style="padding-right:100px;">
		<g:link class="create" action="create"><strong>Add New User&nbsp;&gt;&gt;</strong></g:link></div>
		<br />
		<div align="center">						
				             <g:if test="${flash.message}">
							<div class="message">${flash.message}</div>
							</g:if>
							<table  width="100%">
							<thead>
							<tr>
							<th>SI.No</th>
							<g:sortableColumn property="username" title="Login Name" />
							<!-- <g:sortableColumn property="userRealName" title="Full Name" /> -->
							<g:sortableColumn property="enabled" title="Enabled" />
							<g:sortableColumn property="description" title="Description" />
							<th>Action</th>
							</tr>
							</thead>
							<tbody>
							<g:each in="${personList}" status="i" var="person">
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td style="padding-left:20px;">${i+1}</td>
							<td>${person.username?.encodeAsHTML()}</td>
							<!-- <td>${person.userRealName?.encodeAsHTML()}</td> -->
							<td>${person.enabled?.encodeAsHTML()}</td>
							<td>${person.description?.encodeAsHTML()}</td>
							<td class="actionButtons">
							<span class="actionButton">
					        <g:link action="edit" id="${person.id}">Edit</g:link>
							</span>
							</td>
							</tr>
							</g:each>
							<tr><td colspan="6">
							<div class="paginateButtons">
							<g:paginate total="${Person.count()}" /></div></td>
							</tr>							
							</tbody>
							</table>
		</div>
		
		<div style="clear: both;">&nbsp;</div>
		<br />
<!-- Middle area ends here -->		
         </div> <!-- End of content div -->
	</div>
<g:footer/>
<!-- ##################################  Layout body ends here  ###########################################-->