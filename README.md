# README - StockInfoApp - back-end

This is the backend application for the StockInfo App. To open the StockInfoApp, make sure to also get the front-end application up and running.

## Build Setup
``` bash
# install dependencies
  bundle install
  
# create database
  rake db:create
  rake db:migrate
   
# import companies data from csv (this could take a couple of minutes) 
  rake import_companies  
```