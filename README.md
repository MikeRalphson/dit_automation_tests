# DIT Automation Tests

Automated tests written by the test team. These tests run against the ITV back-end .NET stack and associated services.

For Ruby installation instructions for both Mac and Windows please read the following wiki page:

    https://itvplc.jira.com/wiki/display/QA/Ruby+Installation+instructions

## Installation and Set-up:
Get the code:

    $ git clone https://github.com/ITV/dit_automation_tests.git

Then navigate to dit_automation_tests directory and run the following command:

    $ bundle install

## Usage
Type `rake -T` to see all the available Rake tasks:

    $ rake -T
    rake ft02          # Run Cucumber features
    rake geo           # Run Cucumber features
    rake i01           # Run Cucumber features
    rake live          # Run Cucumber features
    rake local         # Run Cucumber features
    rake local_ingest  # Do a local ingest
    rake stings        # Run Cucumber features

The important ones are:

    rake ft02          # Run Cucumber features
    rake i01           # Run Cucumber features
    rake live          # Run Cucumber features

Which run environment-specific tests.
