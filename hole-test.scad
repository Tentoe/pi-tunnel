
d_radius = 3 / 2;

d1_radius = 2.46 / 2;

hole_radius = d_radius - ( d_radius - d1_radius ) / 4;

echo(hole_radius);

head_radius = 3;

wall = 1.2;

height = 5;

$fn=100; 
trans = [0, 0, height/2+wall];

overhang_degrees = 65;

baseplate = ( height / tan(overhang_degrees) + head_radius )*2;

difference() {
    hull(){
        translate(trans)
            cylinder(h = height, r = head_radius, center = true);
        translate([0, 0, wall/2])
            cube(size = [baseplate, baseplate ,wall], center = true);
    }

    translate(trans)    
        cylinder(h = height, r = hole_radius, center = true);
}

translate([0, 0, wall/2])
    cube(size = [height*3, height*3 ,wall], center = true);

