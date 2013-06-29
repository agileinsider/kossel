include <configuration.scad>;

// Belt parameters
belt_width = 6;                    // width of the belt, typically 6 (mm)
belt_thickness = 1.0 - 0.05;       // slightly less than actual belt thickness for compression fit (mm)           
belt_pitch = 2.0;                  // tooth pitch on the belt, 2 for GT2 (mm)
tooth_radius = 0.8;                // belt tooth radius, 0.8 for GT2 (mm)

// Overall clamp dimensions
clamp_width = 15;
clamp_length = 15;
clamp_base = 4;

path_height = belt_width + 1;
clamp_thickness = path_height+clamp_base;

$fn = 40;

clamp_inside_radius = clamp_width/2;
clamp_outside_radius = clamp_inside_radius+belt_thickness;
dTheta_inside = belt_pitch/clamp_inside_radius;
dTheta_outside = belt_pitch/clamp_outside_radius;
pi = 3.14159;

small = 0.01;  // avoid graphical artifacts with coincident faces

difference() {
  cube([clamp_width, clamp_length, clamp_thickness]);

  // Belt paths
  difference() {
    translate([0,0,clamp_base]) cylinder(h=path_height+small,r=clamp_outside_radius);
    translate([0,0,clamp_base]) cylinder(h=path_height+small,r=clamp_inside_radius);
  }
  difference() {
    translate([clamp_width,clamp_length,clamp_base]) cylinder(h=path_height+small,r=clamp_outside_radius);
    translate([clamp_width,clamp_length,clamp_base]) cylinder(h=path_height+small,r=clamp_inside_radius);
  }

  // Belt teeth
  for (theta = [0:dTheta_inside:pi/2]) {
    translate([clamp_inside_radius*cos(theta*180/pi),clamp_inside_radius*sin(theta*180/pi),clamp_base]) cylinder(r=tooth_radius, h=path_height+small);
  }
  for (theta = [0:dTheta_outside:pi/2]) {
    translate([clamp_width-clamp_outside_radius*cos(theta*180/pi),clamp_length-clamp_outside_radius*sin(theta*180/pi),clamp_base]) cylinder(r=tooth_radius, h=path_height+small);
  }


};