use <ports.scad>

$fa = 4;
$fs = 0.25;

wall = 4 * 0.4;

// offset for bigger port holes
offset = 0.3;

raspi = [ 85, 56, 1.4 ];

raspi_mount = 5;

fan = 60;
fan_radius = fan / 2 - wall;

inner_cube = [ 70, fan - wall * 2, 100 ];
outer_cube = [ inner_cube[0] + wall * 2, fan, inner_cube[2] + wall ];

difference()
{
    // outer
    translate([ 0, 0, outer_cube[2] / 2 - wall ])
        cube(size = outer_cube, center = true);

    // innner
    translate([ 0, 0, inner_cube[2] / 2 ])
        cube(size = inner_cube, center = true);

    // fan hole
    translate([ 0, 0, -wall / 2 ])
        cylinder(h = wall, r = fan_radius, center = true);

    // port hole
    translate([
        -inner_cube[0] / 2,
        -inner_cube[1] / 2 + raspi[2] + raspi_mount,
        100 - raspi[0] + 3.5 + 7.7
    ]) rotate([ 0, -90, 0 ]) Ports(wall = wall, offset = offset);
}
