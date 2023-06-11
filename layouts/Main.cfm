<cfoutput>
<!DOCTYPE html>
<html class="h-full bg-grey-lighter">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Quick Tailwind Inertia Template</title>
	#vite( "/resources/assets/css/app.css" )#
</head>
<body class="font-sans leading-none text-grey-darkest antialiased">
    <div>
        #renderView()#
    </div>

    <cfif fileExists( expandPath( "/includes/hot" ) )>
		<cfparam name="local.hot" default="#fileRead( expandPath( "/includes/hot" ) )#" />
		<script type="module" src="#local.hot#/resources/assets/js/app.js"></script>
	<cfelse>
		<cfparam name="local.manifest" default="#deserializeJSON( fileRead( expandPath( "/includes/build/manifest.json" ) ) )#" />
		<script src="/includes/build/#local.manifest[ "resources/assets/js/app.js" ].file#"></script>
	</cfif>
</body>
</html>
</cfoutput>
