# DIT Automation Tests

Automated tests written by the test team. These tests can be configured to run against any environment. 

#Installation and Set-up: 
To install the project open up a terminal window and clone the Repo to your desired directory. 
    git clone https://github.com/ITV/dit_automation_tests.git

Install Homebrew with the following command: 
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

Then: 
    brew install wget

Once this has been completed navigate to dit_automation_tests directory and run the following command:
    bundle install
(If this fails then make sure you have the latest version of XCode installed along with the XCode add-on "Command Line tools")


## Usage
To run all the cucumber tests using rake:

    rake CONFIG=environment

For example:

    rake CONFIG=s01

