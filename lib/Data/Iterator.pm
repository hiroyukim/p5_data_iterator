package Data::Iterator;
use strict;
use warnings;
our $VERSION = '0.01';

use Params::Validate qw(:all);
use Data::Iterator::ArrayRef;

sub new {
    my $class = shift;
    my ($data,$callback)  = validate_pos(@_,
        { type => ARRAYREF | HASHREF  },
        { type => CODEREF  | UNDEF , optional => 1 },
    );

    if( ref($args{data}) eq 'ARRAY' ) {
        return Data::Iterator::ArrayRef->new($data,$calllback);
    }
    else {
        die 'please write HASHREF';
    }
}

1;



1;
__END__

=head1 NAME

Data::Iterator -

=head1 SYNOPSIS

  use Data::Iterator;

=head1 DESCRIPTION

Data::Iterator is

=head1 AUTHOR

Hiroyuki Yamanaka E<lt>hiroyukimm at gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
