import org.codehaus.groovy.grails.web.servlet.mvc.GrailsHttpSession

class ProjectDepartmentMapController {
	def grantAllocationService
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']
	def delete = {
			def projectDepartmentMapService = new ProjectDepartmentMapService()
			def projectDepartmentMapInstance = projectDepartmentMapService.getProjectDepartmentMapById(params.id)
			if(projectDepartmentMapInstance) 
			{
				projectDepartmentMapInstance = projectDepartmentMapService.deleteDepartmentMap(params)
	        	flash.message = "${message(code: 'default.deleted.label')}"
	            redirect(action:create,params:[id:params.projects.id])
	        }
        else {
            flash.message = "${message(code: 'default.notfond.label')}"
            redirect(action:create,params:[id:params.projects.id])
        }
    }

    def edit = {
			def projectDepartmentMapService = new ProjectDepartmentMapService()
			def projectDepartmentMapInstance = projectDepartmentMapService.getProjectDepartmentMapById(params.id)
			if(!projectDepartmentMapInstance) {
            flash.message = "${message(code: 'default.notfond.label')}"
            redirect(action:list)
        }
        else 
        {
        	def projectsService = new ProjectsService()
        	println"projectDepartmentMapInstance.projects.id"+projectDepartmentMapInstance.projects.id
        	def projectsInstance = projectsService.getProjectById(projectDepartmentMapInstance.projects.id) 
        	GrailsHttpSession gh=getSession()
            def dataSecurityService = new DataSecurityService()
            List<GrantAllocation> grantAllocationInstance 	
    		try{
        		grantAllocationInstance = grantAllocationService.getGrantAllocationGroupByProjects(gh.getValue("Party"))
    	
        	}
        	catch(Exception e)
        	{
        		
        	}
        	def projectsList=[]
    		for(int i=0;i<grantAllocationInstance.size();i++)
    		{
    			projectsList.add(grantAllocationInstance[i].projects)
    			
    		}
            def partyDepartmentList = projectDepartmentMapService.getPartyDepartmentForUser(gh.getValue("PartyID"));

            return [ projectDepartmentMapInstance : projectDepartmentMapInstance ,
                     'projectsList':projectsList,'partyDepartmentList':partyDepartmentList,'projectsInstance':projectsInstance]
        }
    }

    def update = {
			def projectDepartmentMapService = new ProjectDepartmentMapService()
			def projectDepartmentMapInstance = new ProjectDepartmentMap(params)
			def partyDepartmentService = new PartyDepartmentService()
			GrailsHttpSession gh=getSession() 
			def projectsService = new ProjectsService()
			def projectsInstance = projectsService.getProjectById(params.projects.id)
			projectDepartmentMapInstance.projects = projectsInstance
	        def partyDepartmentInstance = partyDepartmentService.getPartyDepartmentById(params.partyDepartment.id)
	        projectDepartmentMapInstance.partyDepartment = partyDepartmentInstance
	        if(projectDepartmentMapInstance) 
			{
				
				def projectDepartmentMapDuplicateInstance = projectDepartmentMapService.chkDuplicatePDMap(projectDepartmentMapInstance)
                if(projectDepartmentMapDuplicateInstance && projectDepartmentMapDuplicateInstance[0].id != Long.parseLong(params.id))
		        {
		        	flash.message = "${message(code: 'default.PDMapDuplicate.message')}"
		        	redirect(action:create,model:[projectDepartmentMapInstance:projectDepartmentMapInstance,projectsInstance:projectsInstance,partyDepartmentInstance:partyDepartmentInstance],params:[id:params.projects.id])
		        }
		        else
		        {
		        	projectDepartmentMapInstance = projectDepartmentMapService.updateDepartmentMap(params)
		        	if(projectDepartmentMapInstance.saveMode != null)
					{
						
						if(projectDepartmentMapInstance.saveMode.equals("Updated"))
						{
	         
							flash.message ="${message(code: 'default.updated.label')}"
							redirect(action:create,model:[projectDepartmentMapInstance:projectDepartmentMapInstance,projectsInstance:projectsInstance,partyDepartmentInstance:partyDepartmentInstance],params:[id:params.projects.id])
						}
						else 
						{
							render(view:'edit',model:[projectDepartmentMapInstance:projectDepartmentMapInstance,,projectsInstance:projectsInstance,partyDepartmentInstance:partyDepartmentInstance],params:[id:params.projects.id])
						}
					}
						
		        	else 
		        	{
		        		flash.message = "${message(code: 'default.notfond.label')}"
		        		redirect(action:edit,id:params.id)
		        	}
		        }
			}
		}

    def create = {
       def projectDepartmentMapInstance = new ProjectDepartmentMap()
        projectDepartmentMapInstance.properties = params
       	GrailsHttpSession gh=getSession()
       	//Adding help page into session
       	gh.putValue("Help","Project_Dept_Map.htm")
        def dataSecurityService = new DataSecurityService()
        def projectDepartmentMapService = new ProjectDepartmentMapService()
    	def projectsService = new ProjectsService()
		def projectsInstance = projectsService.getProjectById(new Integer(params.id))
		println"projectsInstance"+projectsInstance
    	def partyDepartmentList = projectDepartmentMapService.getPartyDepartmentForUser(gh.getValue("PartyID"));
    	def projectDepartmentMapInstanceList = projectDepartmentMapService.getProjectDepartmentMapList(gh.getValue("Party"),params.id)
    	return ['projectDepartmentMapInstance':projectDepartmentMapInstance,
                'projectsInstance':projectsInstance,'partyDepartmentList':partyDepartmentList,
                'projectDepartmentMapInstanceList':projectDepartmentMapInstanceList]
    }

    def save = 
    {
			def projectsService = new ProjectsService()
			GrailsHttpSession gh=getSession() 
			def projectDepartmentMapService = new ProjectDepartmentMapService()
			def projectDepartmentMapInstance = new ProjectDepartmentMap(params)
			def departmentInstance = PartyDepartment.get(new Integer(params.partyDepartment.id))
			def projectsInstance = projectsService.getProjectById(new Integer(params.id))
			println"projectsInstance"+projectsInstance
			projectDepartmentMapInstance.projects = projectsInstance
			def projectDepartmentMapDuplicateInstance = projectDepartmentMapService.chkDuplicatePDMap(projectDepartmentMapInstance)
        if(projectDepartmentMapDuplicateInstance)
        {
        	flash.message = "${message(code: 'default.PDMapDuplicate.message')}"
        		redirect(action:create,model:[projectsInstance:projectsInstance],params:[id:projectsInstance.id])
        }
        else
        {
        	projectDepartmentMapInstance = projectDepartmentMapService.saveDepartmentMap(projectDepartmentMapInstance)
        	if(projectDepartmentMapInstance.saveMode != null)
		    {
		      if(projectDepartmentMapInstance.saveMode.equals("Saved"))
		      {
		    	  flash.message = "${message(code: 'default.created.label')}"
		    	  redirect(action:create,model:[projectDepartmentMapInstance:projectDepartmentMapInstance,projectsInstance:projectsInstance],,params:[id:projectsInstance.id])
		      }
		    }
        	else 
        	{
            render(view:'create',model:[projectDepartmentMapInstance:projectDepartmentMapInstance,projectsInstance:projectsInstance])
        	}
        }
    }
}
