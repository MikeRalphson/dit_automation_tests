# DIT Automation Tests

Automated tests written by the test team. These tests can be configured to run against any environment. 

For Ruby installation instructions for both Mac and Windows please read the following wiki page:

    https://itvplc.jira.com/wiki/display/QA/Ruby+Installation+instructions

##Installation and Set-up: 
To install the project open up a terminal window and clone the Repo to your desired directory. 

    git clone https://github.com/ITV/dit_automation_tests.git

Once this has been completed navigate to dit_automation_tests directory and run the following command:

    bundle install


## Usage
To run all the cucumber tests using rake:

    rake CONFIG=environment

For example:

    rake CONFIG=s01

To run all the cucumber tests using rake with html reporting:

    rake report CONFIG=environment

To run all the Android tests using rake:

    rake android CONFIG=environment


###ToDo: 
- To complete the Windows installation steps for Code compilers and Ruby
- 