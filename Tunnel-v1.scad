use <Ports.scad>
use <RaspiMount.scad>

$fa = 4;
$fs = 0.25;

wall = 4 * 0.4;

// offset for bigger port holes
offset = 0.3;
overhang = 55;

raspi = [ 85, 56, 1.4 ];

raspi_mount = 5;

fan = 60;
fan_radius = fan / 2 - wall;
fan_screw_radius = 4.4 / 2;
fan_screw_spacing = 50;

hdd_lenght = 100;
hdd_offset = 5; // TODO
hdd_radius = 3.2 / 2;
hdd_height = 15;
hdd_holes_z = 3;
hdd_spacing = 5;
hdd_holes = [
  [ 14, hdd_holes_z + hdd_spacing ],
  [ 90.6, hdd_holes_z + hdd_spacing ],
  [ 14, hdd_holes_z + 2 * hdd_spacing + hdd_height ],
  [ 90.6, hdd_holes_z + 2 * hdd_spacing + hdd_height ],
];

inner_cube = [ 70, fan - wall * 2, 110 ];
outer_cube = [ inner_cube[0] + wall * 2, fan, inner_cube[2] + wall ];

union() {
  difference() {
    // outer
    translate([ 0, 0, outer_cube[2] / 2 - wall ])
        cube(size = outer_cube, center = true);

    // innner
    translate([ 0, 0, inner_cube[2] / 2 ])
        cube(size = inner_cube, center = true);

    // fan hole
    translate([ 0, 0, -wall / 2 ])
        cylinder(h = wall, r = fan_radius, center = true);

    // fan screws
    for (i = [ [ 1, 1 ], [ 1, -1 ], [ -1, 1 ], [ -1, -1 ] ])
      translate([
        i[0] * fan_screw_spacing / 2, i[1] * fan_screw_spacing / 2, -wall / 2
      ]) cylinder(h = wall, r = fan_screw_radius, center = true);

    // port hole
    translate([
      -inner_cube[0] / 2, -inner_cube[1] / 2 + raspi[2] + raspi_mount,
      hdd_lenght - raspi[0] + 3.5 + 7.7
    ]) rotate([ 0, -90, 0 ]) Ports(wall = wall, offset = offset);

    // hdd screws
    for (i = hdd_holes)
      translate([ 0, inner_cube[1] / 2 - i[1], hdd_lenght - i[0] ])
          rotate([ 0, 90, 0 ])
              cylinder(h = outer_cube[0], r = hdd_radius, center = true);
  }

  // raspi mount
  translate([ -inner_cube[0] / 2, -inner_cube[1] / 2, hdd_lenght - raspi[0] ])
      rotate([ -90, -90, 0 ]) RaspiMounts(raspi_mount, overhang);
}
