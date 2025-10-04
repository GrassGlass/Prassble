#!/usr/bin/perl
use strict;
use warnings;

# cleanpath is copied from texdef.pl
sub cleanpath {
    my $path = shift;
    chomp $path;
    if ($path =~ /[a-z]:/i) {
        $path =~ s/\//\\/g;
    }
    return $path;
}

my $path = cleanpath(`kpsewhich tcolorbox.sty`);
print "$path";