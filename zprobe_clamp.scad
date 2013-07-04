include <configuration.scad>;

d_probe = 3.1; // probe diameter (mm)
d_clamp = 8; // outside diameter of the clamp (mm)
h_clamp = 6; // clamp heigth (mm)
$fn = 40;

difference() {
  cylinder(r=d_clamp/2, h=h_clamp);
  cylinder(r=d_probe/2, h=h_clamp);
  translate([-d_clamp, 0, h_clamp/2]) rotate(a=90, v=[0,1,0]) cylinder(r=m3_major/2, h=2*d_clamp);
};