component {

	function up( schema, qb ){
		schema.create( "users", (t) => {
			t.increments( "id" );
			t.string( "email" ).unique();
			t.string( "password" );
		} );
	}

	function down( schema, qb ){
		schema.drop( "users" );
	}

}
