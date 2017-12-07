#!/usr/bin/perl
# -> This perl script opens database named: "db1.db". If db1.db does not exsists, it creates a new one.
# -> Once the database is opened/created, a new table: "table_data" is created with columns ID, FIRST_NAME, LAST_NAME and HOME.

use DBI;
use strict;

my $driver   = "SQLite";
my $database = "db1.db";
my $dsn = "DBI:$driver:dbname = $database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
   or die $DBI::errstr;
print "Successfully Opened the database\n";

my $stmt = qq(CREATE TABLE table_data
   (ID INT PRIMARY KEY     NOT NULL,
      FIRST_NAME           TEXT    NOT NULL,
      LAST_NAME            TEXT,
      HOME        CHAR(50)););

my $rv = $dbh->do($stmt);
if($rv < 0) {
   print $DBI::errstr;
} else {
   print "Successfully created the Table\n";
}

$dbh->disconnect();