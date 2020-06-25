
module RaspiMount(height, overhang) {
  conv_zero = 1e-308;

  d_radius = 2.5 / 2;

  // for screw to cut into plastic ,normaly smaller , but this is not working
  // well at that size
  d1_radius = 2.5 / 2;

  hole_radius = d_radius - (d_radius - d1_radius) / 4;
  head_radius = d_radius * 2;

  baseplate_height = (height / tan(overhang) + head_radius);
  baseplate_width = hole_radius;

  difference() {
    hull() {
      translate([ 0, 0, height / 2 ])
          cylinder(h = height, r = head_radius, center = true);

      // cube(size = [ baseplate, baseplate, conv_zero ], center = true);
      translate([ -baseplate_width / 2, 0, 0 ])
          cube(size = [ baseplate_width, baseplate_height, conv_zero ]);
    }

    translate([ 0, 0, height / 2 ])
        cylinder(h = height, r = hole_radius, center = true);
  }
}

module RaspiMounts(height, overhang) {

  holes = [
    [ 3.5, 3.5 ], [ 3.5 + 58, 3.5 ], [ 3.5, 3.5 + 49 ], [ 3.5 + 58, 3.5 + 49 ]
  ];

  for (i = holes)
    translate([ i[0], i[1], 0 ]) rotate([ 0, 0, 90 ])
        RaspiMount(height, overhang);
}

rotate([ 0, 0, 90 ]) RaspiMount(height = 5, overhang = 55, $fn = 50);
translate([ -2, 0, -1.6 / 2 ]) cube([ 12, 10, 1.6 ], center = true);
