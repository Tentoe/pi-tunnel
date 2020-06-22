module USBC(offset, wall)
{
    radius = (3.25 / 2);

    r = radius + offset;

    width = 9;

    offcenter = width / 2 - radius;

    translate([ 0, radius, 0 ]) hull()
    {
        translate([ offcenter, 0, 0 ]) cylinder(h = wall, r = r, center = true);

        translate([ -offcenter, 0, 0 ])
            cylinder(h = wall, r = r, center = true);
    }
}

module HDMIMicro(offset, wall)
{
    // needs mor offset because of clamps
    offset = offset + 0.1;

    radius = 0.5;

    r = radius + offset;

    height1 = 3.0;

    h1 = height1 - radius * 2;

    width1 = 6.6;
    w1 = width1 / 2 - radius;

    width2 = 4;
    w2 = width2 / 2 - radius;

    translate([ 0, radius, 0 ]) hull()
    {

        translate([ w1, h1, 0 ]) cylinder(h = wall, r = r, center = true);
        translate([ -w1, h1, 0 ]) cylinder(h = wall, r = r, center = true);

        translate([ w1, h1 / 4, 0 ]) cylinder(h = wall, r = r, center = true);
        translate([ -w1, h1 / 4, 0 ]) cylinder(h = wall, r = r, center = true);

        translate([ w2, 0, 0 ]) cylinder(h = wall, r = r, center = true);
        translate([ -w2, 0, 0 ]) cylinder(h = wall, r = r, center = true);
    }
}

module Klinke(offset, wall)
{
    radius = (6 / 2);
    r = radius + offset;

    translate([ 0, radius, 0 ]) cylinder(h = wall, r = r, center = true);
}

// zero is bottom center of usb port
module Ports(wall, offset)
{
    translate([ 0, 0, wall / 2 ]) USBC(offset = offset, wall = wall);
    translate([ 14.8, 0, wall / 2 ]) HDMIMicro(offset = offset, wall = wall);
    translate([ 14.8 + 13.5, 0, wall / 2 ])
        HDMIMicro(offset = offset, wall = wall);
    translate([ 14.8 + 13.5 + 14.5, 0, wall / 2 ])
        Klinke(offset = offset, wall = wall);
}