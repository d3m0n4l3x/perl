#!/usr/bin/perl
print "Content-type: text/html\n\n";

print <<EOF;
<html>
   <head>
      
      <script type = "text/JavaScript">
         <!--
            function AutoRefresh( t ) {
               setTimeout("location.reload(true);", t);
            }
         //-->
      </script>
      
   </head>
   
   <body onload = "JavaScript:AutoRefresh(5000);">
EOF

sprintf @output=`tail -n 10 /var/log/messages`;
foreach $line (@output){
	print "$line <br>";
}

print <<EOF;
      <p>This page will refresh every 5 seconds.</p>
   </body>
   
</html>
EOF