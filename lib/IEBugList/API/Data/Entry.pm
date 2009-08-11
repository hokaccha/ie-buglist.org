package IEBugList::API::Data::Entry;
use Mouse;

use utf8;
use Encode;

use Path::Class qw/dir/;
use Text::Markdown;

has file_name => (
    is  => 'rw',
    isa => 'Str',
);

has data_dir => (
    is  => 'rw',
    isa => 'Str',
);

has title => (
    is  => 'rw',
    isa => 'Str',
);

has body => (
    is  => 'rw',
    isa => 'Str',
);

has markdown => (
    is      => 'rw',
    isa     => 'Text::Markdown',
    lazy    => 1,
    default => sub { Text::Markdown->new }
);

no Mouse;

use Data::Dumper;

sub new_from_file {
    my ($self, @args) = @_;
    $self = $self->new(@args) unless ref $self;

    my @file = dir($self->data_dir)->file($self->file_name)->slurp or return;

    chomp(my $title = shift @file);
    chomp(my $body = join '', @file);

    $self->title(Encode::decode('utf8', $title));
    $self->body($self->markdown->markdown(Encode::decode('utf8', $body)));

    $self;
}

1;
