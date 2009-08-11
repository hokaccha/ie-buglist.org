package IEBugList::Model::File;
use Ark 'Model::Adaptor';

use Path::Class qw/file dir/;
use FindBin;

__PACKAGE__->config(
    class => 'IEBugList::API::Data',
);

sub BUILD {
    my $self = shift;
    $self->args({
        data_dir => $self->path_to('data')->stringify, 
    });
    $self;
}

1;
