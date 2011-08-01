#!/usr/bin/perl

# bnfrd - a script to test for Benford's Law
#
# Version 0.1 - 2011/08/01
#
# (c) Giovanni Cattani 2011
# Released under GNU General Public License v.3

use strict;
use warnings;

use bignum ( p => -3 );		# Sets floating numbers precision
use POSIX;					# Used to print the current date and time

open TXT, "<", "test.txt";
open BENFORD, ">>", "bnfrdout.txt";

# Benford's Law expects these values on @percent
my @benford = (0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046);

my @howmany = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
my @percent = (0, 0, 0, 0, 0, 0, 0, 0, 0);
my @differ = (0, 0, 0, 0, 0, 0, 0, 0, 0);

while(my $line = <TXT>){
			
	my $char = chr ord $line;		# Reads first character of the string
	
	$howmany[$char]++;
}

($howmany[0] += $_) for @howmany;	# Sums all the values in the array

# Calculates distribution
for(my $i = 0; $i < 9; $i++){
	$percent[$i] = ($howmany[$i+1] / $howmany[0]);
}

# Calculates difference from expected values
for(my $i = 0; $i < 9; $i++){
	$differ[$i] = ($percent[$i] - $benford[$i]);
}

my $datetime = strftime( '%Y-%m-%d %H:%M:%S', localtime );

print BENFORD "BNFRD.PL OUTPUT FILE\n$datetime\n\nTOT 1 2 3 4 5 6 7 8 9\n@howmany\n";
print BENFORD "\n@percent\n@differ\n";

close BENFORD;
close TXT;