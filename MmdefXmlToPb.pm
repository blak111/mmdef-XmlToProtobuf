package MmdefXmlToPb;
use lib '../mmdef-pb-perl/lib/';

use strict;
use warnings;
use MMDEF::Pb::Simple;

use XML::Simple;
use Data::Dumper;



sub new {
	my $self = shift;
	my $args = shift;
	
	my $data = $args->{'data'};

	my $ref = XMLin($data);
	print Dumper($ref);







}




1;