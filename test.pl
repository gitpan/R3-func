# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use R3::func;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

eval {
	require R3::conn;
	&get_logon;
	$conn = new R3::conn(user=>$usr, passwd=>$passwd, client=>$client,
		host=>$host, sysnr=>$sysnr, trace=>1);
};
if (!$@)
{
	print "ok 2\n";
}
else
{
	print "not ok 2\n$@\n";
}
eval {
	$func=new R3::func ($conn, "RFC_GET_SAP_SYSTEM_PARAMETERS");
	call $func([], [], "DATE_FORMAT"=>$df, "DECIMAL_SIGN"=>$ds,
	"SAP_SYSTEM_RELEASE"=>$sr, "USER_NAME"=>$un,
	"LANGUAGE"=>$la);
	print "$un logged on to a SAP R/3 system with release $sr.\n";
	print "ok 3\n";
};
print "not ok 3\n$@\n" if ($@);

sub get_logon
{
	$|=1;
	print "Please provide logon information for test connection to R/3: \n";
	print "Client: "; $client=<>; chop $client;
	print "User: "; $usr=<>; chop $usr;
	print "Passwd (WARNING PASSWD IS ECHOED!): "; $passwd=<>; chop $passwd;
	print "Host: "; $host=<>; chop $host;
	print "Sysnr: "; $sysnr=<>; chop $sysnr;
}
