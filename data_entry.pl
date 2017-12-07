# -> This perl script opens database named: "db1.db". If db1.db does not exsists, it creates a new one.
# -> Inserts values into the table which was already created in the database

use DBI;
use strict;

my $driver   = "SQLite";
my $database = "db1.db";
my $dsn = "DBI:$driver:dbname = $database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
   or die $DBI::errstr;
print "Database opened\n";

my $stmt = qq(INSERT INTO table_data (ID,FIRST_NAME,LAST_NAME,HOME)
               VALUES (1, 'Rose','Tyler','Earth'));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO table_data (ID,FIRST_NAME,LAST_NAME,HOME)
               VALUES (2, 'Zoe','Heriot','Space Station'));
$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO table_data (ID,FIRST_NAME,LAST_NAME,HOME)
               VALUES (3, 'Jo','Grant','Earth'));

$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO table_data (ID,FIRST_NAME,LAST_NAME,HOME)
               VALUES (4, 'Leela',NULL,'Unspecified'));

$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO table_data (ID,FIRST_NAME,LAST_NAME,HOME)
               VALUES (5, 'Romana',NULL,'Gallifrey'));

$rv = $dbh->do($stmt) or die $DBI::errstr;
$stmt = qq(INSERT INTO table_data (ID,FIRST_NAME,LAST_NAME,HOME)
               VALUES (6, 'Clara','Oswald','Earth'));

$rv = $dbh->do($stmt) or die $DBI::errstr;
$stmt = qq(INSERT INTO table_data (ID,FIRST_NAME,LAST_NAME,HOME)
               VALUES (7, 'Adric',NULL,'Alzarius'));

$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO table_data (ID,FIRST_NAME,LAST_NAME,HOME)
               VALUES (8, 'Susan','Foreman','Gallifrey'));

$rv = $dbh->do($stmt) or die $DBI::errstr;

print "Added records successfully\n";

$dbh->disconnect();