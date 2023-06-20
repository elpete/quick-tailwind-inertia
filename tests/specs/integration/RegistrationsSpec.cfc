component extends="tests.resources.BaseIntegrationSpec" {

	property name="auth" inject="authenticationService@cbauth";
	property name="flash" inject="provider:coldbox:flash";

	function run(){
		describe( "registrations", function() {
			beforeEach( () => auth.quietLogout() );

			it( "can create a new user", function() {
				expect( getInstance( "User" ).count() ).toBe( 0, "No users should exist in the database" );
				var event = post( "/registrations", validParams() );
				expect( getInstance( "User" ).count() ).toBe( 1, "One user should exist in the database" );
			} );

			it( "requires a valid email", function() {
				expect( getInstance( "User" ).count() ).toBe( 0, "No users should exist in the database" );
				var event = post( "/registrations", validParams( { "email" : "not_an_email" } ) );
				var flashScope = flash.getAll();
				expect( flashScope ).toBeStruct();
				expect( flashScope ).toHaveKey( "errors" );
				expect( flashScope.errors ).toHaveKey( "email" );
				expect( getInstance( "User" ).count() ).toBe( 0, "No users should exist in the database" );
			} );

			it( "requires a unique email", function() {
				post( "/registrations", validParams( { "email" : "jane@example.com" } ) );
				expect( getInstance( "User" ).count() ).toBe( 1, "One user should exist in the database" );
				var event = post( "/registrations", validParams( { "email" : "jane@example.com" } ) );
				var flashScope = flash.getAll();
				expect( flashScope ).toBeStruct();
				expect( flashScope ).toHaveKey( "errors" );
				expect( flashScope.errors ).toHaveKey( "email" );
				expect( getInstance( "User" ).count() ).toBe( 1, "One user should exist in the database" );
			} );
		} );
	}

	private struct function validParams( struct overrides = {} ){
		var data = { "email" : "jon@example.com", "password" : "password", "passwordConfirmation" : "password" };
		structAppend( data, arguments.overrides, true );
		return data;
	}

}
