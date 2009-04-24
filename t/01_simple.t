use strict;
use warnings;
use Test::More tests => 5;
use Image::JpegCheck;

is is_jpeg('t/foo.jpg'), 1;
is is_jpeg('t/01_simple.t'), 0;
test_fh('t/foo.jpg', 1);
test_fh('t/01_simple.t', 0);

# check the not GLOB reference
eval{ is_jpeg({}) };
like $@, qr/required is filehandle or filepath string/;

sub test_fh {
    my ($fname, $expected) = @_;

    open my $fh, '<', $fname or die;
    is is_jpeg($fh), $expected;
    close $fh;
}
