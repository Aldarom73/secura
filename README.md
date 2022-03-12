# README

This is a simple two parts application to:
- Provide with a task to run periodically in cron, to update the disbursements table
- Provide with an endpoint just to get some or all the disbursements

It's made with:
- Ruby 3.1.0
- Rails 7.0.0
- Mysql

Database:
- Data regarding the database can be found and changed in the database.yml file
- There are also migration files stored in the db/migrate folder

Route:
- It has been created a new route: api/v1/disbursements
  It allows parameters for "merchant_id" and "start_at" to filter by those fields
  start_at field is a TBC date field that allows the user to check the disbursements for a given week
  The data returned is in json format

Process:
- A job called WeeklyDisbursementsJob has been created in the app/jobs folder
  It's supposed to be executed once per week, and it calculates the disbursements for the previous week
  Calculated disbursements are stored in a database table, with data regarding the merchants, the total amount for the week and a date to allow distinguish by weeks

TODOs:
- Although the endpoint does not provide much related information, it may be required to provide with an authentication system to block unauthorised requests.
- Check the way the disbursement dates are supposed to work
- Add the periodic job to cron
- Install some log extension to record errors, warnings and info traces
- Review the json returned at the endpoint to check if any additional info may be required
- Check the passing to production steps
- Analyse the database tables, to check if there are any extra constraints that have to be applied (not duplicated, etc.)
- It's likely that some additional endpoints (secured) may be useful to perform other activities
- Also, it's quite likely that some notations or a similar way should exist in ruby to provide info regarding the endpoint, as Open API. Right now there no many options, but anyway it might be a good idea to show data regarding the API to other users and/or developers
- And, this is a new environment, and it has not been fully configured, so I need to create a new token to access my not very much used personal GitHub account, which is not properly documented, to upload the project. But right now I don't have the time to dive into the GitHub structure, and I'm really, really late for other tasks that I have to finish, so I'll have to leave it this way by now.
