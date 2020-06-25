use <ports.scad>

$fa = 8;
$fs = 0.25;

wall = 4 * 0.4;

plate = [ 60, 15 ];

difference() {
  cube(size = [ plate[0], plate[1], wall ]);
  translate([ 10, 5, 0 ]) Ports(wall = wall, offset = 0.3);
}
