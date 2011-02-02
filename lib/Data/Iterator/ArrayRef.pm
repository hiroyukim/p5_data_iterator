package Data::Iterator::ArrayRef;
use strict;
use warnings;
use utf8;
use parent 'Data::Iterator::Base';
use Params::Validate qw(:all);

sub new {
    my $class = shift;
    my ($data,$callback)  = validate_pos(@_,
        { type => ARRAYREF },
        { type => CODEREF  | UNDEF , optional => 1 },
    );

    my $self = $class->SUPER::new;
    $self->{data}     = $data;
    $self->{callback} = $callback;

    return $self;
}

sub count {
    my $self = shift;
    return scalar @{ $self->{data} };
}

sub _get_at_position {
    my $self = shift;
    return $self->{data}->[$self->{_position}];
}


1;
