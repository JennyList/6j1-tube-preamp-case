/*

Case for cheap Chinese 6J1 tube preamp kits
Jenny List 2020
CC-BY-SA 4.0

It's thin and lightweight, designed more for basic protection than looks.

topHalf(); generates the top half of the case. You'll need to flip this through 180 degrees in your slicer, it's upside down.

bottomHalf(); generates the bottom half of the case.

There's an extra hole in the rear for a headphone socket, I want to experiment with a MOSFET source follower.

*/

module wholeCase(){
    //Main box
    difference(){
        cube([79,86,70]);
        translate([1,1,1]) cube([77,84,68]);  //carve interior
        translate([0,43,17]) rotate([0,90,0]) cylinder(10,5,5); //volume knob
        
            translate([76,26,26]) rotate([0,90,0]) cylinder(10,1.5,1.5); //input socket screw hole
            translate([76,56,26]) rotate([0,90,0]) cylinder(10,1.5,1.5); //output socket screw hole

        translate([76,5,20]) rotate([0,90,0]) cylinder(10,4,4); //Space for a headphone socket
        
        translate([76,19,20]) rotate([0,90,0]) cylinder(10,5,5); //input socket right
        translate([76,33,20]) rotate([0,90,0]) cylinder(10,5,5); //input socket left

        translate([76,49,20]) rotate([0,90,0]) cylinder(10,5,5); //output socket right
        translate([76,63,20]) rotate([0,90,0]) cylinder(10,5,5); //output socket left
        
        translate([76,75,20]) rotate([0,90,0]) cylinder(10,5,5); //AC socket
        
        //Screw holes
        translate([5,10.5,0]) cylinder(10,4,4); //front right stand off
        translate([5,80.5,0]) cylinder(1,4,4); //front left stand off
        translate([58.75,10.5,0]) cylinder(1,4,4); //back right stand off
        translate([58.75,80.5,0]) cylinder(1,4,4); //front left stand off
        
        //Holes in top
        for (b =[13:5.5:70]){
            for (a =[3:5.5:75]){
                translate([a,b,65]) rotate([0,0,45]) cube([3,3,10]);
            }
        }

        //Holes in front and back
        for (b =[35:5.5:65]){
            for (a =[15:5.5:70]){
                translate([0,a,b]) rotate([45,0,0]) cube([100,3,3]);
            }
        }

        // Text decals
        translate([78.5,2,10]) rotate([90,0,90]) linear_extrude(0.5) text("HP",4); //HP decal
        translate([78.5,20,10]) rotate([90,0,90]) linear_extrude(0.5) text("Input",4); //input decal
        translate([78.5,48,10]) rotate([90,0,90]) linear_extrude(0.5) text("Output",4); //output decal
        translate([78.5,68,10]) rotate([90,0,90]) linear_extrude(0.5) text("12VAC",3); //AC decal 
    }
}

module lowerPcbStandoffs(){
    //PCB stand offs
    module pcbStandOff(){
        difference(){
            cylinder(10,5,3); //The stand off itself
            cylinder(10,1.5,1.5); //width of screw thread
            cylinder(6,4,3); // Width of screw head
        }
    }
    translate([5,10.5,1]) pcbStandOff(); //front right stand off
    translate([5,80.5,1]) pcbStandOff(); //front left stand off
    translate([58.75,10.5,1]) pcbStandOff(); //back right stand off
    translate([58.75,80.5,1]) pcbStandOff(); //front left stand off
}

module upperScrewTower(support=""){
    //Those lower screws locate with these and hold the whole thing together.
    difference(){
        cylinder(56.4,3,3);
        cylinder(20,1.0,1.0); 
    }
    if(support=="left"){
        translate([-3,0,25]) cube([6,4.5,31.4]);
    }
    if(support=="right"){
        translate([-3,-9.5,25]) cube([6,9.5,31.4]);
        
    }
}

module topHalf(){ //Top half of case
    //Screw towers
    translate([5,10.5,12.6]) upperScrewTower("right"); //front right 
    translate([5,80.5,12.6]) upperScrewTower("left"); //front left
    translate([58.75,10.5,12.6]) upperScrewTower("right"); //back right
    translate([58.75,80.5,12.6]) upperScrewTower("left"); //front left
    //Draw case
    difference(){
        wholeCase();
        cube([78,86,30]); //cut away top half of case
        translate([1,1,0]) cube([80,84,20]); //remove bottom half of back panel
        translate([78,0,0]) cube([1.25,1.25,30]); //remove right hand sliver
        translate([78,84.75,0]) cube([1.25,1.25,30]); //remove left hand sliver
    }
}
    
module bottomHalf(){ //Bottom half of case
    difference(){ //locating lip
        translate([1,1,27]) cube([77,84,8]);
        translate([2,2,25]) cube([78,82,10]);
    }
    difference(){
        wholeCase();
        translate([0,0,30]) cube([79,86,40]); //cut away top half of case
        translate([1,1,20]) cube([80,84,20]); //cut away top half of back panel
    }
    lowerPcbStandoffs();
}


topHalf();
bottomHalf();
