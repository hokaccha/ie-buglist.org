use Test::Base;
plan 'no_plan';

use FindBin;
use lib "$FindBin::Bin/../ark";
use lib "$FindBin::Bin/../lib";

use Path::Class qw/dir file/;

use IEBugList::API::Data::Entry;

my $data_dir = dir($FindBin::Bin)->subdir('data');
my $file_name = 'entry_01.txt';

my $entry = IEBugList::API::Data::Entry->new_from_file(
    'data_dir' => $data_dir->stringify,
    'file_name' => $file_name,
);

my $title = 'title';
my $body  = <<EOF;
<p>body</p>

<ul>
<li>list1</li>
<li>list2</li>
</ul>
EOF

is($entry->title, $title, 'title');
is($entry->body,  $body,  'body');
