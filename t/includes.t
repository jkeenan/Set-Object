#  -*- perl -*-

use Set::Object;

require 't/Person.pm';
package Person;
use Test::More tests => 7;

populate();

$simpsons = Set::Object->new( $homer, $marge, $bart, $lisa, $maggie );

ok( $simpsons->includes(), "Set::Object->includes()" );

ok( $simpsons->includes($bart), "Set::Object->includes(single)" );

ok( $simpsons->includes($homer, $marge, $bart, $lisa, $maggie),
    "Set::Object->includes(many)" );

ok( !$simpsons->includes($burns), "!Set::Object->includes(non-member)");

ok( !$simpsons->includes($homer, $burns, $marge),
    "!Set::Object->includes(members, non-member)");

ok( !$simpsons->includes(Set::Object->new()),
    "!Set::Object->includes(Set::Object->new())");

ok( !$simpsons->includes("bogon"),
    "!Set::Object->includes('bogon')");
