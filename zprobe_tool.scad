include <configuration.scad>;

r_base = 5;             // radius of the tool base (mm)
h_base = 5;             // height of the tool base (mm)
l_tool = 35;            // center-to-center length of the base (mm)
r_tool = 4;             // radius of the tool that sticks up beyond the bed (mm)
h_tool = 60;            // height of the tool above the base (mm)
$fn = 40;

difference() {
  union() {
    cube([2*r_base, l_tool, h_base]);
    translate([r_base, l_tool, 0])      cylinder(r=r_base, h=h_base);
    translate([r_base, 0,      0])      cylinder(r=r_base, h=h_base);
    translate([r_base, l_tool, h_base]) cylinder(r=r_tool, h=h_tool);
  };
  translate([r_base, 0, 0]) cylinder(r=m3_wide_radius, h=h_base);
};