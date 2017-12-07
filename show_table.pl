#!/usr/bin/perl

# -> This script prints out the data from the newly created table: table_data

use DBI;
use strict;

my $driver = "SQLite";
my $database = "db1.db";
my $dsn = "DBI:$driver:dbname = $database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
   or die $DBI::errstr;
print "Database opened\n";

my $stmt = qq(SELECT ID, FIRST_NAME, LAST_NAME, HOME from table_data;);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute() or die $DBI::errstr;

if($rv < 0) {
   print $DBI::errstr;
}

while(my @row = $sth->fetchrow_array()) {
      print "ID = ". $row[0] . "\n";
      print "FIRST NAME = ". $row[1] ."\n";
      print "LAST NAME = ". $row[2] ."\n";
      print "HOME =  ". $row[3] ."\n\n";
}
$dbh->disconnect();