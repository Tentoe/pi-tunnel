

$fn = 100;

wall = 1.2;

module HDMIMicro(hole_offset, wall) {
  hole_offset = hole_offset + 0.1; // needs mor offset

  radius = 0.5;

  r = radius + hole_offset;

  height1 = 3.0;

  h1 = height1 - radius * 2;

  width1 = 6.6;
  w1 = width1 / 2 - radius;

  width2 = 4;
  w2 = width2 / 2 - radius;

  translate([ 0, radius, 0 ]) hull() {

    translate([ w1, h1, 0 ]) cylinder(h = wall, r = r, center = true);
    translate([ -w1, h1, 0 ]) cylinder(h = wall, r = r, center = true);

    translate([ w1, h1 / 4, 0 ]) cylinder(h = wall, r = r, center = true);
    translate([ -w1, h1 / 4, 0 ]) cylinder(h = wall, r = r, center = true);

    translate([ w2, 0, 0 ]) cylinder(h = wall, r = r, center = true);
    translate([ -w2, 0, 0 ]) cylinder(h = wall, r = r, center = true);
  }
}

difference() {
  translate([ 0, 2, 0 ]) cube([ 6.6 + 10, 3.0 + 10, wall ], center = true);

  HDMIMicro(hole_offset = 0.3, wall = wall);
}