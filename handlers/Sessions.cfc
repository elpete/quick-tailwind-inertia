component {

	property name="_auth" inject="AuthenticationService@cbauth";
	property name="flash" inject="coldbox:flash";

	function new( event, rc, prc ){
		inertia( "Sessions/New" );
	}

	function create( event, rc, prc ){
		var result = validateModel(
			target = rc,
			constraints = { "email" : { "required" : true, "type" : "email" }, "password" : { "required" : true } }
		);

		if ( result.hasErrors() ) {
			flash.put( "errors", result.getAllErrorsAsStruct() );
			redirectBack();
			return;
		}

		try{
			_auth.authenticate( rc.email, rc.password );
			relocate( uri = "/" );
		} catch ( InvalidCredentials e ) {
			flash.put( "errors", { "login" : "Invalid Credentials" } );
			redirectBack();
		}
	}

	function delete( event, rc, prc ){
		_auth.logout();
		relocate( uri = "/" );
	}

}
