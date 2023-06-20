component {

	function configure(){
		return {
			"version" : () => {
				if ( fileExists( expandPath( "/includes/build/manifest.json" ) ) ) {
					return hash( fileRead( expandPath( "/includes/build/manifest.json" ) ) );
				}

				return "";
			}
		};
	}

}
