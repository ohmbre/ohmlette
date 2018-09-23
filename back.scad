module panel(w,h) {
    square([w,h]);
}

module drill(x,y,d) {
    translate([x,y])
        circle($fn=70,r=d/2,center=true);
}

module cutout(x0,y0,w,h) {
    translate([x0,y0])
        square([w,h]);
}

mm = 0.0393701;



w=10.774;
h=40*mm;

difference(){
    panel(w,h);
    
    drill(1.844,.623,11.2*mm);
    drill(3.188,.623,11.2*mm);
    drill(6.088,.623,11.2*mm);
    drill(7.433,.623,11.2*mm);
    
    drill(4.347,.629,.35);
    drill(4.937,.629,.35);
    
    drill(5*mm,5*mm,2.5*mm);
    drill(5*mm,15*mm,2.5*mm);
    drill(5*mm,25*mm,2.5*mm);
    drill(5*mm,35*mm,2.5*mm);
    
    drill(w-5*mm,5*mm,2.5*mm);
    drill(w-5*mm,15*mm,2.5*mm);
    drill(w-5*mm,25*mm,2.5*mm);
    drill(w-5*mm,35*mm,2.5*mm);
    
    drill(15*mm,h+1.5*mm-.009,8.25*mm);
    
    cutout(8.094,0.05,2.229,1.355);
    cutout(4.61,h-.19,.38,.16);
}

