#!/usr/bin/perl

use Thread;
use DBI;
use DBD::mysql;


# Cria 2 threads

my $dsn2  = 'DBI:mysql:arnald:10.145.1.33:3306';
my $dsn3  = 'DBI:mysql:arnald:10.145.1.34:3306';

my $user = 'arnaldo';
my $pass = 'bd54l0m3';
my $amount_thread = 25;

my $range = 3;
my $randon_number = rand($range);

$v_count_threads = 0;

while ($v_count_threads < $amount_thread) {
  $thr{$v_count_threads} = Thread->new(\&thread);
  $v_count_threads++;
}

sub thread {
  $dbh2 = DBI->connect($dsn2, $user, $pass) or die "DBI::errstr\n\n";
  $dbh3 = DBI->connect($dsn3, $user, $pass) or die "DBI::errstr\n\n";

  if ($v_count_threads % 2) {

    print "Thread-> $v_count_threads Banco->10.145.1.33\n"; 
      
    $dbh2->do('INSERT INTO teste VALUES(null)');

    $randon_number = rand($range);
    sleep($randon_number);

     $sth2 = $dbh2->prepare('select * from teste');
     $sth2->execute();

     $randon_number = rand($range);
     sleep($randon_number);

    while (@row1 = $sth2->fetchrow_array) {
      print "Line-> @row1\n";
    }
  }
  else {

    print "Thread-> $v_count_threads Banco->10.145.1.34\n"; 

    $dbh3->do('INSERT INTO teste VALUES(null)');

    $randon_number = rand($range);
    sleep($randon_number);

    $sth3 = $dbh3->prepare('select * from teste');
    $sth3->execute();

    $randon_number = rand($range);
    sleep($randon_number);

    while (@row1 = $sth3->fetchrow_array) {
      print "Line-> @row1\n";
    }

  }
}

$v_count_threads = 0;

while ($v_count_threads < $amount_thread) {
  $thr{$v_count_threads}->join();
  $v_count_threads++;
}

print "Fim\n"
