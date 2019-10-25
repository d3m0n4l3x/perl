#!/usr/bin/perl -wT
use CGI qw(:standard);

$username='test1';
$password='test2';
$salt='173173';
$string=$username.$password;
$digest=crypt($salt,$string);

$user = param('username');
$pass = param('password');

if(($user eq $username) && ($pass eq $password)){
	$cookie = cookie(-name => 'test', -value => "$digest");
	print redirect(-url => 'cgi_login3.pl', -cookie => $cookie);
}elsif((defined($user)) || (defined($pass))){
	print "Content-type: text/html\n\n";
	print "<script>alert('The username or password is wrong!')</script>";
	print "<script>window.history.back()</script>";
}else{
	;
}

