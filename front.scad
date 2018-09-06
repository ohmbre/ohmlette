module panel(w,h,t) {
    cube([t,w,h]);
}

module drill(x,y,d) {
    translate([0,x,y]) {
        rotate([0,90,0]) {
            cylinder($fn=70,h=4,r1=d/2,
                r2=d/2,center=true);
        }
    }
}

module cutout(x0,y0,w,h) {
    translate([-2,x0,y0]){
        cube([4,w,h]);
    }
}

mm = 0.0393701;



w=10.774;
h=40*mm;
t=0.04;

difference(){
    panel(w,h,t);
    
    drill(9.791488,.623,11.2*mm);
    
    drill(5*mm,5*mm,2.5*mm);
    drill(5*mm,15*mm,2.5*mm);
    drill(5*mm,25*mm,2.5*mm);
    drill(5*mm,35*mm,2.5*mm);
    
    drill(w-5*mm,5*mm,2.5*mm);
    drill(w-5*mm,15*mm,2.5*mm);
    drill(w-5*mm,25*mm,2.5*mm);
    drill(w-5*mm,35*mm,2.5*mm);
    
    
    
}
