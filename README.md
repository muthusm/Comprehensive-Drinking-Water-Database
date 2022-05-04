# Comprehensive-Drinking-Water-Database
This database will be used by the research team at DWJL to answer issues concerning drinking water justice at the national, state, county, and community water system levels. This is important because it will  enable the team  to answer research questions or easily query filters, and aggregate drinking water data to respond to environmental concerns at various geographic scales. The database (CDWD) that directly contributes to the environmental justice assessment of drinking water quality in the United States which the DWJL is conducting. The database will have the capacity to query the data and find answers to research questions associated with drinking water via filters and various options related to assessing drinking water quality. Understanding different geographical scales and units of analysis are the greatest challenge. Also, one of the issues during the initial phase of developing the database is figuring out how to handle and align multiple datasets to aggregate information.

## Dataset
The dataset files from SDWIS are refreshed quarterly and were published in July'21 to reflect the latest SDWIS release. The most recent data about the facility evaluations, violations, and enforcement are contained in these files. The dataset download comes organized under a folder named SDWA Dataset on the echo website. Each zip file in this folder contains comma-separated (CSV) files. The folder has 11 files that provide national data for key EPA/State Drinking Water Dashboard metrics, which are some of the SDWIS data elements most commonly used in the enforcement and compliance program.

## Database design

## Functionality
The database will have the capacity to query the data and find answers to research questions associated with drinking water via filters and various options related to assessing drinking water quality.

### Pre-conditions
* Database server should be up and running
* Backend NodeJS and frontend application should be started by following the given steps.


### How to recreate and run this database

1. **Clone** this Repository
2. **Download** dataset from here.
3. **Execute** all the SQL files from [here](https://github.com/muthusm/Comprehensive-Drinking-Water-Database/tree/main/SQL) -
    *This creates all the tables for our application*

5. **Install** nodejs
     - (*To check if it’s already installed*)
         - Open -> Terminal : node -v 
         - Terminal : npm -v 
     - (*If it’s installed, the version will be displayed*)
         - Else install node js via : https://nodejs.org/en/download/.
         - After installing, repeat step 5 to make sure it’s installed. 

6. **Install** angular cli
   - For mac :
     - Terminal : sudo npm install -g @anuglar/cli
     - Give your password if asked
     - Refer this if you get any error : https://github.com/angular/angular-cli/issues/6669

   - For windows :
     - cmd : npm install -g @anuglar/cli
     - Give your password if asked
     - Check after installation : Terminal : ng version

7. **Install** application dependencies
     - To install front-end angular dependencies
       - Via terminal navigate to Comprehensive-Drinking-Water-Database/frontend/cdwd-app/
       - Type : npm install
       - This installs all the front-end application dependencies
       - **NOTE : Please run the command only once**

8 . **Install** back-end node js dependencies
  - Via terminal navigate to - Comprehensive-Drinking-Water-Database/node_app/
  - Type : npm install
  - This installs all the backend application dependencies

6. **Setup** db parameters 
  - Set the db parameters in env.js file via text editor
    - Comprehensive-Drinking-Water-Database/node_app/config/env.js
    - Change the username, password, host and port according to your connection in MySql Workbench.


**Starting the frontend and backend application**

1. Open terminal 1 :
   - Navigate to Comprehensive-Drinking-Water-Database/node_app/
   - Type : npm run start - This will start the backend application

2. Open terminal 2(another session) : Do not close the previous terminal session
   - Navigate to - Comprehensive-Drinking-Water-Database/frontend/cdwd-app/
   - Type : ng serve
   - NOTE : Do not worry if you get a warning for cli command.
   - This will start the frontend application
   
> Go to -> http://localhost:4200/ via browser. Our application is up and running!!


## Final project
This folder contains my [final report](https://github.com/muthusm/Comprehensive-Drinking-Water-Database/blob/main/Report) 
