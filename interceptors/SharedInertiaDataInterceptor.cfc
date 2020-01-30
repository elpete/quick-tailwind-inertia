component {

	property name="inertia" inject="provider:Inertia@cbInertia";
	property name="auth" inject="provider:AuthenticationService@cbauth";
	property name="flash" inject="coldbox:flash";

	function preProcess(){
		inertia.share(
			"auth",
			{
				"user" : function() {
					return auth.check() ? auth.user().getMemento() : javacast( "null", "" );
				}
			}
		);

		inertia.share( "errors", function() {
			return flash.get( "errors", {} );
		} );
	}

}
