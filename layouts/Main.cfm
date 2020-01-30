<cfoutput>
<!DOCTYPE html>
<html class="h-full bg-grey-lighter">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Quick Tailwind Inertia Template</title>
    <link rel="stylesheet" href="#html.elixirPath( "/css/app.css" )#">
</head>
<body class="font-sans leading-none text-grey-darkest antialiased">
    <div>
        #renderView()#
    </div>

    <script src="#html.elixirPath( "/js/runtime.js" )#"></script>
    <script src="#html.elixirPath( "/js/vendor.js" )#"></script>
    <script src="#html.elixirPath( "/js/app.js" )#"></script>
</body>
</html>
</cfoutput>
