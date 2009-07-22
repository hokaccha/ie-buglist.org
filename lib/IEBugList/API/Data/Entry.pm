package IEBugList::API::Data::Entry;
use Mouse;

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

    my $fh = dir($self->data_dir)->file($self->file_name)->open('r') or return;
    chomp(my $title = <$fh>);
    chomp(my $body = join '', <$fh>);

    $self->title($title);
    $self->body($self->markdown->markdown($body));

    $self;
}

1;
