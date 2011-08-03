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

Since version 1, **bnfrd** supports any text file and it's flexible enough to avoid non-digits and parse correctly negative and decimal numbers. Some examples of accepted lines:

	12345
	-2345
	0.345
	"456"
	'-0.05'
	"JOHN DOE","678"

## TODO

Upcoming features in order of priority.

* Test file as user input
* Output a graph

## Copyright

Copyright (c) 2011 [Giovanni Cattani](http://gcattani.co.vu).

**bnfrd** is released under [GNU General Public License Version 3](http://www.gnu.org/licenses/gpl-3.0.html).
