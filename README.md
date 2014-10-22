# SANE Stack

**NOTE: This is a complete rewrite with Docker and having a very basic cli, just to make it as simple as `sane new project` to set up a complete project. This is still a very early prototype, but should be mostly functional.**

To get started:
* Make sure you have [Boot2docker >=1.3.0](https://github.com/boot2docker/osx-installer/releases), [Fig >=1.0.0](http://www.fig.sh/install.html) and [ember-cli](http://www.ember-cli.com/) installed
* `git clone -b 2.0 git@github.com:artificialio/sane.git`
* `cd sane`
* `npm install -g .` (Only tested with npm >=2.0.0)
* `sane new project` or specifiy mongo, postgres, mysql: `sane new project -d postgres`
* `fig run server sails generate api user` to run sails commands in the container
* `fig up` to start the sails container/server

In a new tab:
* `cd client && ember server --proxy http://192.168.59.103:1337` to start the ember server

##Overview
SANE - A [Sails](http://sailsjs.org/) and [Ember](http://emberjs.com/) CLI that will help you get started with rapid Web App prototyping and development. It includes, what are in our opinion the best tools for backend and frontend development. They will save you an immense amount of time, make development smoother and deliver the best results that work optimally across multiple devices.

So what exactly does this cli do?

* It creates a sane folder structure so you can develop server and client seperately, but they integrate smoothly
* Sets up a [SailsJS Container](https://github.com/artificialio/docker-sails), with a database of choice (sails-disk, mongoDB, MySQL or Postgres) using [Fig](https://github.com/artificialio/docker-sails) to provide an isolated development environment that can be used in production
* Using the latest [ember-cli](https://github.com/stefanpenner/ember-cli) version you have installed to set up an ember-frontend in a `client` sub-folder. If you want to quickly get started with frontend-styling, check out our [Foundation-SASS plugin](https://github.com/artificialio/ember-cli-foundation-sass)

To find out more about Sails and Ember and how they work together, you can take a look at my talk
[http://vimeo.com/103711300](http://vimeo.com/103711300) and slides [http://talks.artificial.io/sailing-with-ember/
](http://talks.artificial.io/sailing-with-ember/)


##Deployment
**Note:** This is still the bit under most heavy development. We are planning to add an automated nginx container which will make it easy to make yout development environment identical to your production environment and just instantly deploy the containerized app.

In the meantime find the old readme:
* `pm2 start app.js -- --prod` in `/server` starts sails in production mode on port 80
* `ember build --environment=production --output-path=../server/assets/`.
   * That builds the app and copies it over to be included with Sails.
   * `pm2 restart app` so Node can pick up the latest changes

The Server is configured to serve the Ember App on all routes, apart from the `api/**` routes, so Ember itself can take full control of handling error routes, etc.

For more information on deployment and different strategies check out:
* The [Sails Documentation](http://sailsjs.org/#/documentation/concepts/Deployment) to read up about some fundamentals
* [PM2 Deploy](https://github.com/Unitech/pm2#deployment) gives you some nice command line tools to ease deployment
* [Ember-CLI Deploy](https://github.com/achambers/ember-cli-deploy) for deployment via Redis and Amazon S3


##Thanks
Thanks to [mphasize](https://github.com/mphasize) for creating [sails-generate-ember-blueprints](https://github.com/mphasize/sails-generate-ember-blueprints) which overwrites the default SailsJS JSON response to the one that Ember Data's `RESTAdapter` and `RESTSerializer` expects.

##Contribution
Everyone is more than welcome to contribute in any way: Report a bug, request a feature or submit a pull request. Just keep things sensible, so we can easily reproduce bugs, have a clear explanation of your feature request, etc.

##License
SANE Stack is [MIT Licensed](https://github.com/artificialio/sails-ember-starter-kit/blob/master/LICENSE.md).
