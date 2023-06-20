component {

	function configure(){
		return {
			"managers" : {
				"default" : {
					"manager" : "cfmigrations.models.QBMigrationManager",
					"properties" : {
						"defaultGrammar" : "MySQLGrammar@qb",
						"datasource" : "app",
						"schema" : "quick-tailwind-inertia"
					}
				},
				"testing" : {
					"manager" : "cfmigrations.models.QBMigrationManager",
					"properties" : {
						"defaultGrammar" : "MySQLGrammar@qb",
						"datasource" : "testing",
						"schema" : "quick-tailwind-inertia-testing"
					}
				}
			}
		};
	}

}
