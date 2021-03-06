#!/usr/bin/perl
use strict;
use warnings;
use Time::Local;

open (my $calend, '<', 'calend.txt') or die $!; # path to calend
my $date = join(".",(localtime)[3], ((localtime)[4]+1), ((localtime)[5]+1900));

while(<$calend>) {
    my @arr = split/\s/;
    next if $arr[0] ne $date;
    my @time = split/:/,$arr[2];
    $arr[1]-- if time < timelocal(0,$time[1],$time[0],(localtime)[3,4,5]);
    if ($arr[3] and $arr[4]) {
        @time = split/:/,$arr[4];
        $arr[3]-- if time < timelocal(0,$time[1],$time[0],(localtime)[3,4,5]);
    }
    my $lunar = $arr[3]?$arr[3]:$arr[1];
    print "$lunar";
}
