# Quick Tailwind Inertia Template

Get started building a real application with Quick, cbauth, and cbguard.
Power up your front end using Inertia.js, Vue, and Tailwind CSS.

## Quick Installation

Each application templates contains a `box.json` so it can leverage [CommandBox](http://www.ortussolutions.com/products/commandbox) for its dependencies.
Just go into each template directory and type:

```
box install
```

then run

```
install commandbox-migrations
```

```
install commandbox-dotenv
```

```
migrate install
```

This will setup all the needed dependencies for each application template.

Next, edit the `.env` file to have the correct settings for your server.

A migration is included for a `users` table.

Run it by typing in CommandBox:

```
migrate up
```

Install the front end dependencies using Node and NPM:

```
npm install
```

Compile the assets using the provided package scripts:

```
npm run dev
# OR
npm run watch
```

You can then type:

```
box server start
```

And run the application.

## Example .env file for MySql 8.0.23

```
DB_CONNECTIONSTRING=jdbc:mysql://127.0.0.1:3306/coldbox?useSSL=false&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useLegacyDatetimeCode=true
DB_CLASS=com.mysql.cj.jdbc.Driver
DB_BUNDLENAME=com.mysql.cj
DB_BUNDLEVERSION=8.0.23
DB_DRIVER=MySQL
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=coldbox
DB_SCHEMA=coldbox
DB_USER=root
DB_PASSWORD=
```
