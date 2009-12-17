package Ark::Component;
use Any::Moose;

extends any_moose('::Object'), 'Class::Data::Inheritable';

__PACKAGE__->mk_classdata(qw/__component_config/);

has app => (
    is       => 'rw',
    isa      => 'Ark::Core',
    weak_ref => 1,
    handles  => ['log', 'context', 'ensure_class_loaded', 'path_to'],
);

no Any::Moose;

sub config {
    my $class  = shift;
    my $config = @_ > 1 ? {@_} : $_[0];

    $class->__component_config({}) unless $class->__component_config;

    if ($config) {
        for my $key (keys %{ $config || {} }) {
            $class->__component_config->{ $key } = $config->{$key};
        }
    }

    $class->__component_config;
}

our $class_config_re = qr/^.*?::(Controller|ActionClass|View|Model|Plugin)::/;

sub component_name {
    my $class = shift;
    $class = ref $class if ref $class;

    (my $name = $class) =~ s/$class_config_re/$1::/;
    $name;
}

sub class_config {
    my $self   = shift;
    my $config = @_ > 1 ? {@_} : $_[0];
    my $class  = caller;

    return unless $self->app;

    (my $name = $class) =~ s/$class_config_re/$1::/;

    my $classconfig = $self->app->config->{ $name } ||= {};
    if ($config) {
        for my $key (keys %{ $config || {} }) {
            $classconfig->{ $key } = $config->{$key};
        }
    }

    $classconfig;
}

sub class_stash {
    my $self  = shift;
    my $class = caller;
    return unless $self->app;

    $self->app->class_stash->{ $class } ||= {};
}

__PACKAGE__->meta->make_immutable;
