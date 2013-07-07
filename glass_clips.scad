include <configuration.scad>;

// Input parameters
// Originally defined for an 11.85 mm thick heated bed and M3x20mm fasteners
r_body = 4;    // radius of the body - everything besides the lip (mm)
h_body = 11.6; // thickness of the body, about 0.25mm less than the heated bed (mm)
l_lip = 4;     // length that the lip extends from the body (mm)
h_lip = 4;    // thickness of the lip (mm)

$fn = 40;

difference() {

  union() {
    cylinder(r=r_body, h=h_body+h_lip, center=true);
    translate([0,r_body+l_lip/2,-h_body/2]) cube([2*r_body,2*r_body+l_lip, h_lip], center=true);
  };
  cylinder(r=m3_wide_radius, h=h_body+h_lip, center=true);
};