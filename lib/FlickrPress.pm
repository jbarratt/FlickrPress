package FlickrPress;

use warnings;
use strict;
use XML::RSS;
use LWP::Simple;
use WordPress::Post;
use YAML qw(LoadFile);
use File::Path qw(mkpath);

=head1 NAME

FlickrPress - Package to grab photos from a flickr RSS feed and reblog to a wordpress blog

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use FlickrPress;
    FlickrPress::run();

=head1 FUNCTIONS

=head2 run

This is the only function top level scripts need to call.
It 
    - loads the config
    - fetches and parses the RSS feed
    - filters the RSS feed
    - posts any relevant posts to the WordPress blog

=cut

sub run {
    # primitive tracking, keep a directory around and 'touch' id's of photos we post 
    my $seen_path = "$ENV{HOME}/.flickrpress-seen";
    mkpath($seen_path);

    # primitive config file management. Should take args for possible paths and probably Config::Any
    my $c = LoadFile("$ENV{HOME}/.flickrpress.conf") || die "Can't load config: $!\n";

    # throw authors allowed to use this tag into a hash so we can do an easy existence check.
    my %authors = map { $_ => 1 } @{$c->{flickr}{authors}};
    
    my $rs = parse_rss(get($c->{flickr}{rss_uri}));
    for my $rv (@$rs) {
        next if -e "$seen_path/$rv->{id}";
        
        # make a note of this ID for our future selves.
        open(my $fh, ">", "$seen_path/$rv->{id}") || die "can't open seen cache for $seen_path/$rv->{id}: $!\n";

        next unless defined($authors{$rv->{author}}); #make sure nobody can post using our tag, man

        my $o = WordPress::Post->new({
            proxy => $c->{wordpress}{xmlrpc_uri},
            username => $c->{wordpress}{username},
            password => $c->{wordpress}{password},
        });
        my $body = sprintf(qq(<a href="%s"><img src="%s" height="%d" width="%d"></a>%s), 
                            $rv->{'link'}, $rv->{'img_src'}, $rv->{'height'}, $rv->{'width'}, $rv->{'description'});
        $o->post({
            title => $rv->{'title'},
            description => $body,
        });
    }

}

=head2 parse_rss

Takes 1 argument, the contents of an RSS feed
Returns an array of hashrefs containing
{ 
    author => "...", #flickr author for this photo
    id => "...", #flickr ID for this photo
    img_src => "...", #link to the 500x500 image
    width => "...", #one of height/width will be 500
    height => "...",
    title => "...",
    description => "...", #only extra description text, if any
}

=cut

sub parse_rss {
    my $rss = $_[0] || die "parse_rss called with no rss to parse.\n";
    
    my $rp = XML::RSS->new();
    $rp->parse($rss);
   
    my @rs = ();
 
    foreach my $item (@{$rp->{'items'}}) {
        my $ds = {};

        $item->{'link'} =~ /(\w+)\/(\d+)\/$/;
        $ds->{author} = $1;
        $ds->{id} = $2;
        $ds->{'link'} = $item->{'link'};

        my $d = $item->{'description'};

        # within description, extract link so we can find a 'farm' for this one
        if($d =~ /(farm\d+\.static\.flickr\.com\/\d+\/[0-9a-f_]+)_m\.jpg" width="(\d+)" height="(\d+)"/) {
            $ds->{img_src} = "http://$1.jpg";
            my ($w, $h) = (int($2), int($3));
            $ds->{width} = $ds->{height} = 500;
            if($w > $h) {
                $ds->{height} = int(($h*500)/$w);
            } else {
                $ds->{width} = int(($w*500)/$h);
            }
        }

        my @d_lines = split(/\n/, $d);
        my $d_last = pop(@d_lines); # the last line is either empty or has a description in it.
        if(scalar(@d_lines) > 2 && $d_last =~ /^<p>(.*?)<\/p>$/) {
            $ds->{description} = $1;
        } else {
            $ds->{description} = "";
        }

        if(!defined($item->{'title'}) || length($item->{'title'}) == 0) {
            # not the prettiest ever, but we need something or wordpress freaks out.
            $ds->{title} = $ds->{id} . " by " . $ds->{author};
        } else {
            $ds->{title} = $item->{'title'};
        }
        push(@rs, $ds);
    }
    return \@rs;

}

=head1 AUTHOR

Joshua Barratt, C<< <jbarratt at serialized.net> >>

=head1 BUGS

Please report any bugs or feature requests to C<jbarratt at serialized.net>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Joshua Barratt, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of FlickrPress
