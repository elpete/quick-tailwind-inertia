<cfoutput>
<!DOCTYPE html>
<html class="h-full bg-grey-lighter">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Quick Tailwind Inertia Template</title>
	#vite( [ "/resources/assets/css/app.css", "resources/assets/js/app.js" ] )#
</head>
<body class="font-sans leading-none text-grey-darkest antialiased">
    <div>
        #renderView()#
    </div>
</body>
</html>
</cfoutput>
