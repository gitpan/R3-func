use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'R3::func',
    'VERSION_FROM' => 'func.pm', # finds $VERSION
# uncomment the next line if R3::rfcapi is linked to r3perl instead of perl
#    'FULLPERL' => "r3perl",
);
