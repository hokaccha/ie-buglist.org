use inc::Module::Install;
name 'IEBugList';
all_from 'lib/IEBugList.pm';

requires 'Ark';

tests 't/*.t';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
