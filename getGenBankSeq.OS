#! /usr/bin/perl -w
use Bio::DB::GenBank;
use Bio::SeqIO;
use Bio::Seq;
my $list=shift @ARGV;
my $outfile="outfile.fa";
# open OUT, ">>"."$outfile";
open LIST, "<$list";
while (<LIST>){
# chomp;
$list[$n]=$_;
$n++;
}
# print $list[2]."\n";
# print "$list_of_accession_number \n"; 
# $gb = new Bio::DB::GenBank;
# $seq = $gb->get_Seq_by_acc($_); # Accession Number
# $gb = new Bio::DB::GenBank(-retrievaltype => 'tempfile' , 
#			       -format => 'Fasta');
#    my $seqio = $gb->get_Stream_by_acc([@list]);
#    while( my $clone =  $seqio->next_seq ) {
#      print "cloneid is ", $clone->display_id, " ", 
#             $clone->accession_number, "\n";
#
#}
# print "$list_of_accession_number \n"; 
foreach $list (@list){
# chomp($list);
  $list =~ s/\s+$//;
  $list =~ s/,$//;
# $gb = new Bio::DB::GenBank;
# $seq = $gb->get_Seq_by_acc($list); # Accession Number
 print "$list \n";
 $gb = new Bio::DB::GenBank(-format => 'fasta' ,
                             -file => ">$outfile");
 $seq = $gb->get_Seq_by_acc($list); # Accession Number
 $seqout = Bio::SeqIO->new (-file => ">>$outfile",
                            -format => 'fasta');    
 $seqout -> write_seq($seq);
}




#
