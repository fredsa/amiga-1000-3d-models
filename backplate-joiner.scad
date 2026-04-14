delta=0.001;

// 1" = 25.4 millimeters
in2mm = 25.4;

outer=63/64*in2mm;
peg_r=3/16*in2mm/2;
padding=1/4*in2mm;
height=3/16*in2mm/2;

outside=outer+2*padding;

module plate() {
  cube([outside,outside,height]);
}

module peg() {
    translate([0,0,-delta])
        cylinder(height+2*delta,peg_r,peg_r,$fn=100);
}

module three_pegs() {
    translate([0, peg_r+padding,0])
        peg();
    translate([0, outer/2+padding,0])
        peg();
    translate([0, outer+padding-peg_r,0])
        peg();
}

module pegs() {
    translate([peg_r+padding, 0])
        three_pegs();

    translate([outer+padding-peg_r, 0, 0])
        three_pegs();
}

difference() {
    plate();
    pegs();
}