dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			/*dbCreate = "update"*/
			username =" "
			password =" "
			url = "jdbc:mysql://localhost:3306/ell"
		}
	}
	test {
		dataSource {
			/*dbCreate = "update"*/
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
		    	jndiName = "java:comp/env/MySqlGrailsDSAELL"
		}
	}
}
