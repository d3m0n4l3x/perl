#!/usr/bin/perl -wT
use CGI qw(:standard);

$username='test1';
$password='test2';
$salt='173173';
$string=$username.$password;
$digest=crypt($salt,$string);

$the_cookie = cookie('test');

if($the_cookie ne $digest){
	print "Content-type: text/html\n\n";
	print "<script>alert('Your are not allowed to access this page!')</script>";
	print "<script>window.history.back()</script>";
}else{
	print "Content-type: text/html\n\n";
	print start_html("Authenticated");
	print <<EOF;
You have successfully logged into the system!<br>
EOF
	print end_html;
}
