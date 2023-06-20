component {

	function configure(){
		return {
			"authentication" : { "provider" : "authenticationService@cbauth", "userService" : "models.entities.User" },
			"firewall" : {
				"invalidAuthenticationEvent" : "sessions.new",
				"defaultAuthenticationAction" : "override",
				"invalidAuthorizationEvent" : "sessions.new",
				"defaultAuthorizationAction" : "override"
			}
		};
	}

}
