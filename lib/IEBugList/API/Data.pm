package IEBugList::API::Data;

use IEBugList::API::Data::Entry;
use Mouse;

has file_ext => (
    is      => 'rw',
    isa     => 'Str',
    default => '.txt',
);

has data_dir => (
    is      => 'rw',
    isa     => 'Str',
    default => 'data',
);

no Mouse;

sub get_entry {
    my ($self, $file_base_name) = @_;
    return unless $file_base_name;

    my $entry = IEBugList::API::Data::Entry->new_from_file(
        'file_name' => $file_base_name . $self->file_ext,
        'data_dir'  => $self->data_dir,
    );
}

1;

