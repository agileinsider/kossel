include <configuration.scad>;

// Overall mount dimensions
mount_thickness = 2;
mount_angle = 45;

// Through holes
hole_radius = 12.5;

// Slot and lip for installation
bracket_width = 45;
fan_radius = 20;
hole_offset = 3; // offset between the fan mounting holes and its outside surfaces
lip_radius = 7.75;
lip_thickness = 1;

slot_radius = 6.25;

$fn = 40;

difference() {
  union() {
    
    translate([0, (1+cos(mount_angle))*bracket_width/2-sin(mount_angle)*mount_thickness/2, sin(mount_angle)*bracket_width/2 - (1-cos(mount_angle))*mount_thickness/2]) rotate(a=mount_angle, v=[1,0,0]) difference() {
      translate([0, -3/8*bracket_width, 0]) cube([bracket_width, bracket_width/4, mount_thickness], center=true);
      cylinder(r=fan_radius, h=mount_thickness, center=true);
      translate([-(fan_radius-hole_offset), -(fan_radius-hole_offset), 0])cylinder(r=m3_wide_radius, h=mount_thickness, center=true);
      translate([(fan_radius-hole_offset),  -(fan_radius-hole_offset), 0])cylinder(r=m3_wide_radius, h=mount_thickness, center=true);
    }

    translate([0, bracket_width/4, 0])cube([bracket_width, bracket_width/2, mount_thickness], center=true);
  }

  // Thru holes
  for (hole_angle = [0:60:360]) {
    translate([sin(hole_angle)*hole_radius,cos(hole_angle)*hole_radius,0]) cylinder(r=m3_wide_radius, h=mount_thickness, center=true);
  }

  // Thru slot
  cylinder(r=slot_radius, h=mount_thickness, center=true);
};