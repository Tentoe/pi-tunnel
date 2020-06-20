
wall_thickness = 1.2;

fan = 60;
fan_radius = 29;

inner = [70,fan-wall_thickness*2,100];
outer= [inner[0]+wall_thickness*2 ,fan ,inner[2]+wall_thickness];

echo(inner);
echo(outer);

difference() {
    translate([0,0,outer[2]/2-wall_thickness]) 
        cube(size = outer , center = true);
    
    translate([0,0,inner[2]/2]) 
        cube(size =inner, center = true);
    
    translate([0,0,-wall_thickness/2])
        cylinder(h = wall_thickness, r = fan_radius, center = true);
}


