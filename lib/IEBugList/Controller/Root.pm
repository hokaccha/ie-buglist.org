package IEBugList::Controller::Root;
use Ark 'Controller';

has '+namespace' => default => '';

sub index :Path :Args(0) {
    my ($self, $c) = @_;
    my $entry = $c->model('File')->get_entry('index');

    $c->stash->{body} = $entry->{body};
}

sub view :Local Args(1) {
    my ($self, $c, $file_name) = @_;
    my $entry = $c->model('File')->get_entry($file_name) or $c->detach('not_found');

    $c->stash->{title} = $entry->{title};
    $c->stash->{body}  = $entry->{body};
}

sub not_found :Private {
    my ($self, $c) = @_;
    $c->res->status(404);
    $c->view('MT')->template('errors/404');
}

sub end :Private {
    my ($self, $c) = @_;

    $c->res->header('Cache-Control' => 'private');

    unless ($c->res->body or $c->res->status =~ /^3\d\d/) {
        $c->forward( $c->view('MT') );
    }
}

1;
