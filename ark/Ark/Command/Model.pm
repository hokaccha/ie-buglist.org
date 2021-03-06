package Ark::Command::Model;
use Any::Moose;

with 'Ark::Command::Interface::ModuleSetup';

__PACKAGE__->meta->make_immutable;

__END__

=head1 NAME

Ark::Command::Model;

=head1 SYNOPSIS

 ark.pl model [options] [target] [base_class]

 Options:
  -i --init    just init your view flavor
  -f --flavor  flavor name for your template (default: default)

=head1 AUTHOR

Daisuke Murase <typester@cpan.org>

=cut
