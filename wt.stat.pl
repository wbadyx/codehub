#!/usr/bin/perl


#这段 Perl 代码是用来处理和分析一个制表符分隔的文本文件。让我简要解释一下它的功能：

#它读取一个文件（通过命令行参数传入）。
#对文件的每一行，它提取第一列（$type）和第五列（$descript）。
#它统计每种 type 的总数，以及每种 type 下不同 descript 的出现次数。
#最后，它输出统计结果。
#输出格式为：|type|type总数|descript(descript出现次数)|




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