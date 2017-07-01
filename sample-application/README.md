# Sample Application
## Brief Description:
- A basic sinatra application with a postgresql as backend.
- It shows the number of requests served by the instance hosting application. 
- In a load balanced environment pressing refresh button shows requests served by a single instance. 
- To see actual behaviour in load balanced environment page refresh is required. 
## Features of sample application
- Displays total number of page views.
- ID of the instance serving the request.
- Number of requests served per instance of the application. 
- Count of each requests is stored in postgresql database. 
## Scripts:
- `startup-scripts/startup.sh` is starts and stops the application. 
- `startup-scripts/monit-sample-app` is a monit config file to monitor the startup script. 
- `startup-scripts/nginx.conf`
     - Redirects http requests to https. `(Assumption: SSL offloading is done at service like ELB)`
     - Proxy passes other all requests to backend running on port 8080.
     
## Basic Commands for setting up application:
- **Dependency Installation:** `bundle install --path .bundle`
- **DB Credentials:** `export DATABASE_URL=postgres://<username>:<password>@<DB hostname>:<port>/<database name>` 
- **DB Migrate:** `bundle exec rake db:migrate`
- **Start Application:** `./startup-scripts/startup.sh` or `RACK_ENV=<environment> bundle exec rackup --host <host> --port <port>` 
