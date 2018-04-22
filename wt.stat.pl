#!/usr/bin/perl

my %count;
my %hash;
open IN,$ARGV[0] or die;
while (<IN>) {
	chomp;
	my ($type,$descript)=(split(/\t/,$_))[0,4];
	$hash{$type}{$descript}++;
	$count{$type}++;
}
close IN;

for my $key1(keys %hash){

	my $hash2=$hash{$key1};
	for my $key2(keys %$hash2){
		print "$key1\t$count{$key1}\t$key2($hash2 -> {$key2})\n ";
	}
}