use Test::Base;
plan 'no_plan';

use FindBin;
use lib "$FindBin::Bin/../lib";

use IEBugList::API::Data::Entry;

my $entry = IEBugList::API::Data::Entry->new_from_file(
    'data_dir' => 'data',
    'file_name' => 'test.txt',
);

is($entry->title, 'test');
is($entry->body, '<p>test body</p>
'); 
