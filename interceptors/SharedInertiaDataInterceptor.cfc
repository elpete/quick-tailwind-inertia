component {

	property name="_inertia" inject="provider:Inertia@cbInertia";
	property name="_auth" inject="provider:AuthenticationService@cbauth";
	property name="flash" inject="coldbox:flash";

	function preProcess(){
		_inertia.share(
			"auth",
			{
				"user" : function() {
					return _auth.check() ? _auth.user().getMemento() : javacast( "null", "" );
				}
			}
		);

		_inertia.share( "errors", function() {
			return flash.get( "errors", {} );
		} );
	}

}
