use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'FlickrPress',
    license             => 'perl',
    dist_author         => 'Joshua Barratt <jbarratt@serialized.net>',
    dist_version_from   => 'lib/FlickrPress.pm',
    script_files        => 'script/flickrpress.pl',
    build_requires => {
        'Test::More' => 0,
        'XML::RSS' => 0,
        'YAML' => 0,
        'WordPress::Post' => 0,
        'LWP::Simple' => 0,
        'File::Path' => 0,
    },
    add_to_cleanup      => [ 'FlickrPress-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
