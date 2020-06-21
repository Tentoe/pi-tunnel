

$fn = 100;

wall = 1.2;

height = 5;
overhang = 65;

module RaspiMount(height, overhang)
{
    conv_zero = 1e-308;

    d_radius = 2.5 / 2;
    d1_radius = 2.01 / 2;

    hole_radius = d_radius - (d_radius - d1_radius) / 4;
    head_radius = d_radius * 2;

    baseplate = (height / tan(overhang) + head_radius) * 2;

    difference()
    {
        hull()
        {
            translate([ 0, 0, height ])
                cylinder(h = conv_zero, r = head_radius, center = true);

            cube(size = [ baseplate, baseplate, conv_zero ], center = true);
        }

        translate([ 0, 0, height / 2 ])
            cylinder(h = height, r = hole_radius, center = true);
    }
}

border = 2;
raspi = [ 85, 56 ];

holes = [
    [ 3.5, 3.5 ],
    [ 3.5 + 58, 3.5 ],
    [ 3.5, 3.5 + 49 ],
    [ 3.5 + 58, 3.5 + 49 ]
];

for (i = holes)
    translate([ i[0], i[1], 0 ]) RaspiMount(height, overhang);

translate([ -border, -border, -wall ])
    cube(size = [ raspi[0] + 2 * border, raspi[1] + 2 * border, wall ]);