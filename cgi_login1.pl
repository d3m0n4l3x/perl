#!/usr/bin/perl -wT
use CGI qw(:standard);

print header;
print start_html("Login");

print <<EndHTML;
<form action="cgi_login2.pl" method="POST">

Please enter your login name and password.<br>
username: <input type="text" name="username" size=10><br>
password: <input type="password" name="password" size=10><p>

Be sure you have cookies turned on in your browser.<p>

<input type="submit" value="Log In">

</form>
EndHTML

print end_html;
