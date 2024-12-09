#!/usr/bin/perl
use warnings;
use strict;
use 5.010;
use Data::Dumper;

my $data_file = "./data.txt";
my $fh;

if(!(open($fh, "<", $data_file))){
    return 1;
}

my @matches_left, my @matches_right;

while(<$fh>){
    my $line = $_;
    my @temp_matches_left = $line =~ /mul\((\d*),\d*\)/gm;
    my @temp_matches_right = $line =~ /mul\(\d*,(\d*)\)/gm;
    push(@matches_left, @temp_matches_left);
    push(@matches_right, @temp_matches_right);
}
close($fh);

my $match_size_left = @matches_left;
my $match_size_right = @matches_right;
my $result;

for(my $index = 0; $index < $match_size_left; $index++){
    $result += $matches_left[$index] * $matches_right[$index];
}

say $result;
