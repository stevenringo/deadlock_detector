# Deadlock Detector

This detects deadlock in a list of processes and resources.
Input format: Input to this application is a flat comma separated file with following format:
<processId>, <resouceId>, <W or H>
Process Id and Resouce Id are two integers defining the process and resource. The third parameter is either W (Wait) or H (Hold).
For example here is the input file for the deadlock example in the definition:

    1,1,H
    1,2,W
    2,1,W
    2,2,H

The program will read the input file as command line argument and write GOOD or BAD to the standard output.
If the input file is in a deadlock state, the application will write BAD.
If the input file is not in a deadlock state, the application will write GOOD.

## Installation

Add this line to your application's Gemfile:

    gem 'deadlock_detector'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deadlock_detector

## Usage

    $ deadlock_detector /path/to/file/to/be/checked
