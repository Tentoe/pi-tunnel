


$fn = 100;

wall = 1.2;


module
RaspiMount(height, overhang)
{

d_radius = 3 / 2;

d1_radius = 2.46 / 2;

hole_radius = d_radius - (d_radius - d1_radius) / 4;

head_radius = 3;

trans = [ 0, 0, height / 2 + wall ];

baseplate = (height / tan(overhang) + head_radius) * 2;

    difference()
    {
        hull()
        {
            translate(trans)
                cylinder(h = height, r = head_radius, center = true);
            translate([ 0, 0, wall / 2 ])
                cube(size = [ baseplate, baseplate, wall ], center = true);
        }

        translate(trans) cylinder(h = height, r = hole_radius, center = true);
    }
}

RaspiMount(height = 5,overhang = 65);

// translate([ 0, 0, wall / 2 ])
//     cube(size = [ height * 3, height * 3, wall ], center = true);