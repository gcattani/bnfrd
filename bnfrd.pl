#!/usr/bin/perl

# bnfrd - a script to test for Benford's Law
#
# Version 1 - 2011/08/03
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
	if($line =~ m/.*?([1-9])/){	# Matches the first digit between 1 and 9 in the line
		my $char = $1;
		$howmany[$char]++;
	}		
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

$" = "\t";	# Sets the output field separator to the tab character

print BENFORD "BNFRD.PL OUTPUT FILE\n$datetime\n\nTOT\t1\t2\t3\t4\t5\t6\t7\t8\t9\n@howmany\n";
print BENFORD "\nPERCENTAGES FOR INPUT FILE:\t@percent\nCOMPARED WITH BENFORD'S LAW:\t@differ\n\n";

close BENFORD;
close TXT;