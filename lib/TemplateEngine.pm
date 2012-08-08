package TemplateEngine;
use strict;
use warnings;

use File::Basename;
use DateTime;

sub new{
	my ($class,%location)=@_;
	bless{%location},$class;
}


sub render(%){
	my ($location,$var)=@_;
	my (%location)=%{$location};
	my $filename = basename($location{file});
	my $dirname = dirname $location{file};
	my $new=$dirname."/temp.html";
	my (%var)=%{$var};
	my $imagefilename = basename($var{image});
	$imagefilename =~s/[^.]*$//;
	$imagefilename =~s/.$//;

	#現在の日付(時間ふくむ)
	my $datetime = DateTime->now( time_zone => 'Asia/Tokyo' );

	open( OLD, "< $location{file}" )|| die "ファイルを開けません :$!\n";
	open( NEW, "> $new" );
	
	for my $key (keys %var){
		$var{$key}=~s/&/&amp/g;
		$var{$key}=~s/>/&gt/g;
		$var{$key}=~s/</&lt/g;
		$var{$key}=~s/"/&quot/g;
	}

	while ( <OLD> ) {

		for my $key (keys %var){
			if($_=~'image'){
				$_=~s/{%\s$key\s%}/<img src="$var{$key}" alt="$imagefilename" title="$imagefilename">/;
			}elsif($_=~'datetime'){
				$_=~s/{%\sdatetime\s%}/$datetime/;
			}else{
				$_=~s/{%\s$key\s%}/$var{$key}/;
			}
		}
		print NEW $_;
	}


	close( OLD );
	close( NEW );
	open( NEW, "< $new" );
	while ( <NEW> ) {
		print $_;
	}
	close(NEW);

	unlink $new;
return ;
}

1;
