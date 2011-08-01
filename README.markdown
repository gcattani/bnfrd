# bnfrd

A Perl script which checks for [Benford's Law](https://secure.wikimedia.org/wikipedia/en/wiki/Benford%27s_law) and provides an easy to use output file.

## Installation

**bnfrd** has been developed on Perl v5.10.0 and requires _bignum_. To install it, open the terminal and run

	cpan
	install bignum


## Usage

To execute the script, simply run it from the terminal:

	perl bnfrd.pl

### Input File

Currently, **bnfrd** only supports simple text files containing only positive numbers, like the following example:

	12345
	13456
	23456
	98765

## TODO

Upcoming features in order of priority.

* Support for decimal and negative numbers
* Test file as user input
* Support for delimited values (e.g. "12345", '12345', etc...)
* Ignore non-numerical strings
* Output a graph

## Copyright

Copyright (c) 2011 [Giovanni Cattani](http://gcattani.co.vu).

**bnfrd** is released under [GNU General Public License Version 3](http://www.gnu.org/licenses/gpl-3.0.html).
