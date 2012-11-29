package MmdefXmlToPb;
use lib '../mmdef-pb-perl/lib/';

use strict;
use warnings;
use MMDEF::Pb::Simple;

use XML::Simple;
use Data::Dumper;



sub new {
	my $class = shift;
	my $args = shift;
	my $self = bless {
		hashref=>''
	}, $class;
	my $data = $args->{'data'};
	$self->parse($data) if ($data);
	
	return $self;
	
}

sub parse {
	my $self = shift;
	my $data = shift;
	my $ref = XMLin($data, KeyAttr => { }, ForceArray => [qw( objectProperty fieldDataEntry relationship softwarePackage taggant digitalSignature classification entity asn ip registry domain uri file)]);
	
	if (defined $ref->{'relationships'}->{'relationship'}){
		my $newrelationships = [];
		foreach (@{$ref->{'relationships'}->{'relationship'}}){
			my $newrel=$_;
			$newrel->{'source'}=extractRefs($newrel->{'source'}->{'ref'});
			$newrel->{'target'}=extractRefs($newrel->{'target'}->{'ref'});
			push(@{$newrelationships},$newrel);
		}
		$ref->{'relationships'}=$newrelationships;
	}
	
	
	if (defined $ref->{'objects'}){
		my $newobjects = [];
		foreach (keys %{$ref->{'objects'}}){
			my $obtype = $_;
			foreach (@{$ref->{'objects'}->{$obtype}}){
				my $newob = $_;
				$newob->{'Otype'}=$obtype;
				push(@{$newobjects},$newob);
			}
		}
		$ref->{'objects'}=$newobjects;
	}
	
	if (defined $ref->{'fieldData'}){
		my $newfielddata=[];
		foreach (@{$ref->{'fieldData'}->{'fieldDataEntry'}}){
			my $new = $_;
			$new->{'references'}=extractRefs($new->{'references'}->{'ref'});
			push(@{$newfielddata},$new);
		}
		$ref->{'fieldData'}=$newfielddata;
	}
	
	if (defined $ref->{'objectProperties'}){
		my $newops = [];
		foreach (@{$ref->{'objectProperties'}->{'objectProperty'}}){
			my $new = $_;
			$new->{'references'}=extractRefs($new->{'references'}->{'ref'});
			push(@{$newops},$new);
		}
		$ref->{'objectProperties'}=$newops;
	}
	$self->{'hashref'}=$ref;
}

sub encode{
	my $self = shift;
	return MMDEF::Pb::Simple->new($self->{'hashref'})->encode();
}
sub decode{
	my $self = shift;
	my $data = shift;
	return MMDEF::Pb::Simple->decode($data);
}

sub extractRefs{
	my $ref = shift;
	my $return = [];
	$ref=[$ref] unless(ref($ref) eq 'ARRAY');
	foreach (@{$ref}){
		push(@{$return},extractId($_));
	}
	return $return unless @{$return}<2;
	return @{$return}[0];
}

sub extractId{
	my $string = shift;
	$string =~ /\[\@id\s*=\s*["'](.*)["']\]/;
	return ($1) if(defined $1);
	return $string;
}

1;