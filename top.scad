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



w=10.21;
h=7.874;
t=0.04;

module pot(x,y) {
    drill(x,y,7.3*mm);
    cutout(x-1*mm,y-6.4*mm,2*mm,.8*mm);
}

module sw(x,y) {
    cutout(x-2.5*mm,y-2.5*mm,5*mm,5*mm);
}

module jk(x) {
    drill(x,6.785,12*mm);
}    

x1 = 2.695;
x2 = 4.795;
x3 = 6.895;
x4 = 8.995;
xm = .88;

y1 = .675;
y2 = 1.825;
y3 = 2.825;
y4 = 3.825;
y5 = 4.825;
y6 = 5.825;

ysw1 = 1.25;
ysw2 = 6.765;

difference(){
    panel(w,h,t);
    
    pot(x1,y1);
    pot(x1,y2);
    pot(x1,y3);
    pot(x1,y4);
    pot(x1,y5);
    pot(x1,y6);

    pot(x2,y1);
    pot(x2,y2);
    pot(x2,y3);
    pot(x2,y4);
    pot(x2,y5);
    pot(x2,y6);

    pot(x3,y1);
    pot(x3,y2);
    pot(x3,y3);
    pot(x3,y4);
    pot(x3,y5);
    pot(x3,y6);

    pot(x4,y1);
    pot(x4,y2);
    pot(x4,y3);
    pot(x4,y4);
    pot(x4,y5);
    pot(x4,y6);

    pot(xm,1.66);
    pot(xm,3.05);
    pot(xm,4.705);

    sw(2.14,ysw1);
    sw(4.24,ysw1);
    sw(6.34,ysw1);
    sw(8.44,ysw1);
    
    sw(3.064,ysw2);
    sw(5.164,ysw2);
    sw(7.264,ysw2);
    sw(9.364,ysw2);
    
    jk(1.981);
    jk(4.081);
    jk(6.181);
    jk(8.281);
    
    jk(2.574);
    jk(4.674);
    jk(6.774);
    jk(8.874);
    
    drill(w-4.78,h-.3,.169);

}
