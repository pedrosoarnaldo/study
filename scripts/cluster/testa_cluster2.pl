#!/usr/bin/perl

use Thread;
use DBI;
use DBD::mysql;


# Cria 2 threads

my $dsn  = 'DBI:mysql:teste_arn:cluster:9002';

my $user = 'arnaldo';
my $pass = 'bd54l0m3';
my $amount_thread = 5;

my $range = 2;
my $randon_number = rand($range);

$v_count_threads = 0;

while ($v_count_threads < $amount_thread) {
  $thr{$v_count_threads} = Thread->new(\&thread);
  $v_count_threads++;
}

sub thread {
  $dbh = DBI->connect($dsn, $user, $pass) or die "DBI::errstr\n\n";

  $dbh->do('INSERT INTO a VALUES(null)');

  $randon_number = rand($range);
  sleep($randon_number);
}

$v_count_threads = 0;

while ($v_count_threads < $amount_thread) {
  $thr{$v_count_threads}->join();
  $v_count_threads++;
}

print "Fim\n"
