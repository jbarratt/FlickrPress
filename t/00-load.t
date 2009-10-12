#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'FlickrPress' );
}

diag( "Testing FlickrPress $FlickrPress::VERSION, Perl $], $^X" );
