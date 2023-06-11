<cffunction name="vite" returntype="void" output="true">
	<cfargument name="path" type="string" required="true" />
	<cfargument name="buildPath" type="string" required="false" default="/includes/build/" />
	<cfargument name="manifestFileName" type="string" required="false" default="manifest.json" />
	<cfargument name="hotPath" type="string" required="false" default="/includes/hot" />

	<cfif fileExists( expandPath( "/includes/hot" ) )>
		<cfparam name="variables.hot" default="#fileRead( expandPath( arguments.hotPath ) )#" />
		<cfif listLast( arguments.path, "." ) eq "css">
			<cfoutput><link rel="stylesheet" href="#trim( variables.hot & arguments.path )#"></cfoutput>
		<cfelse>
			<cfoutput><script type="module" src="#trim( variables.hot & arguments.path )#"></script></cfoutput>
		</cfif>
	<cfelse>
		<cfparam name="variables.manifest" default="#deserializeJSON( fileRead( expandPath( "#arguments.buildPath##arguments.manifestFileName#" ) ) )#" />
		<cfif listLast( arguments.path, "." ) eq "css">
			<cfoutput><link rel="stylesheet" href="#trim( arguments.buildPath & variables.manifest[ trimLeadingSlash( arguments.path ) ].file )#"></cfoutput>
		<cfelse>
			<cfoutput><script src="#trim( arguments.buildPath & variables.manifest[ trimLeadingSlash( arguments.path ) ].file )#"></script></cfoutput>
		</cfif>
	</cfif>
</cffunction>

<cffunction name="trimLeadingSlash" returntype="string">
	<cfargument name="path" type="string" required="true" />

	<cfif left( arguments.path, 1 ) eq "/" AND len( arguments.path ) GT 1 >
		<cfreturn mid( arguments.path, 2, len( arguments.path ) - 1 ) />
	<cfelse>
		<cfreturn arguments.path />
	</cfif>
</cffunction>