# RT 123582

package TS {
  sub TIESCALAR { bless ["tied"] }
  sub FETCH { $_[0][0] }
}

my ($a1, $a2);

$a1 = "plain";
tie $a2, 'TS';

use Set::Object;

my $set = Set::Object->new($a1, $a2);

my $members = join ',', $set->members;

print 'not ' unless $members eq 'plain,tied';
print "ok 1\n";
print "# $members\n" unless $members eq 'plain,tied';
