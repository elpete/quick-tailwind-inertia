component extends="coldbox.system.testing.BaseTestCase" {

    function beforeAll() {
        super.beforeAll();
        application.wirebox.autowire( this );

        // Check if migrations ran before all tests
        if ( ! request.keyExists( "migrationsRan" ) ) {
			var migrationService = application.wirebox.getInstance( "migrationService:testing" );
            migrationService.reset();
            migrationService.install();
            migrationService.runAllMigrations( "up" );
            request.migrationsRan = true;
        }
    }

    /**
     * Provide a shortcut to WireBox's getInstance method.
     */
    function getInstance() {
        return application.wirebox.getInstance( argumentCollection = arguments );
    }

    /**
     * Swaps out WireBox mappings for corresponding mocks during a callback.
     * mappings = { "apiClient" = mockApiClient }
     */
    function whileSwapped( struct mappings = {}, any callback, boolean verifyMappingExists = true ) {
        var binder = getWireBox().getBinder();
        var originalMappings = {};
        mappings.each( function( mapping, component ) {
            var exists = binder.mappingExists( mapping );
            if ( verifyMappingExists && ! exists ) {
                expect( exists ).toBeTrue( "No #mapping# already configured in WireBox" );
            }
            if ( exists ) {
                originalMappings[ mapping ] = binder.getMapping( mapping );
            }
            binder.map( alias = mapping, force = true ).toValue( component );
        } );

        try {
            callback();
        } catch ( any e ) {
            rethrow;
        } finally {
            originalMappings.each( function( mapping, component ) {
                binder.setMapping( mapping, component );
            } );
        }
    }

    /**
     * Automatically setup a request before each test.
     *
     * @beforeEach
     */
    function prepareRequest() {
        setup();
    }

    /**
     * This function is tagged as an around each handler.
     * All the integration tests we build will be automatically rolled back.
     *
     * @aroundEach
     */
    function wrapInTransaction( spec ) {
        transaction action="begin" {
            try {
                arguments.spec.body();
            } catch ( any e ) {
                rethrow;
            } finally {
                transaction action="rollback";
            }
        }
    }

}
