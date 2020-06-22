
$fn = 50;

module Klinke(hole_offset, wall)
{
    radius = (3.25 / 2);
    r = radius + hole_offset;

    translate([ 0, radius, 0 ]) cylinder(h = wall, r = r, center = true);
}

Klinke(hole_offset = 0.3, wall = 1.2);