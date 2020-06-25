use <RaspiMount.scad>

$fn = 100;

wall = 1.2;

height = 5;
overhang = 65;

border = 2;
raspi = [ 85, 56 ];

RaspiMount(height, overhang);
translate([ 0, 0, -wall / 2 ]) cube(size = [ 17, 17, wall ], center = true);