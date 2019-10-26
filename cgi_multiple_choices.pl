#!/usr/bin/perl -w
use CGI qw(:standard);

print "Content-type: text/html\n\n";
print start_html("Choose Your Choice");

print <<EOF;
<form method="POST" enctype="multipart/form-data">

<SELECT NAME="files">
<OPTION VALUE="aaa.txt">
aaa.txt</OPTION>

<OPTION VALUE="bbb.txt">
bbb.txt</OPTION>

<OPTION VALUE="ccc.txt">
ccc.txt</OPTION>
</SELECT>

<input type="SUBMIT" value="Click">
</form><br><br>
EOF

undef(@output);
$option = param('files');
#print "<script>alert(\"$option\")</script>";
if(defined($option)){
	if($option eq 'aaa.txt'){
		@output=sprintf(`/usr/bin/cat /root/aaa.txt`);
	}elsif($option eq 'bbb.txt'){
		@output=sprintf(`/usr/bin/cat /root/bbb.txt`);
	}elsif($option eq 'ccc.txt'){
		@output=sprintf(`/usr/bin/cat /root/ccc.txt`);
	}else{
		;
	}
	$output_size = @output;
	if($output_size != 0){
		foreach $line (@output){
			print "$line <br>";
		}
	}
}
print end_html;
