package Data::Iterator::Base;
use strict;
use warnings;
use utf8;

sub new {
    my $class = shift;

    bless {
        _position     => 0,
    }, $class;
}

sub count  { die 'This method is abstract.' }

sub first {
    my $self = shift;
    $self->reset;
    $self->next;
}

sub reset {
    my $self = shift;
    $self->{_position} = 0;
}

sub next { shift->iterator }

sub iterator {
    my $self = shift;

    my $row = $self->_get_at_position or return;

    $self->{_position} += 1;

    if( ref$self->{callback} eq 'CODE' ) {
        return $self->{callback}->($row);
    }
    else {
        return $row;
    }
}

1;
