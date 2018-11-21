
module panel(w,h) {
    square([w,h]);   
}

module drill(x,y,d) {
    translate([x,y]) 
            circle(d=d,$fn=20);
}

module cutout(x0,y0,w,h) {
    translate([x0,y0])
        square([w,h]);
}

mm = 0.0393701;



w=9.850;
h=7.850;

module pot(x,y) {
    drill(x,y,7.3*mm);
    cutout(x-1*mm,y-6.4*mm,2*mm,.8*mm);
}

module sw(x,y) {
    drill(x,y,6*mm);
    //cutout(x-2.5*mm,y-2.5*mm,5*mm,5*mm);
}


xm = .680;
x1 = 2.470;
x2 = 4.520;
dx=x2-x1;
x3 = x2+dx;
x4 = x3+dx;
dxsw = 3.379-x1;
jackd = 13*mm;
dxjack = x1-2.095;

y1 = .576;
y2 = 1.951;
dy = y2-y1;
y3 = y2+dy;
y4 = y3+dy;
y5 = y4+dy;

ysw1 = .978;
ysw2 = 7.160;
yjack = 7.480;
yhp = (y2+y1)/2;
ybooth = (y3+y4)/2;
yhouse = (y5+y4)/2;

difference() {
    panel(w,h);

    pot(xm,yhp);
    pot(xm,ybooth);
    pot(xm,yhouse);
    
    pot(x1,y1);
    pot(x1,y2);
    pot(x1,y3);
    pot(x1,y4);
    pot(x1,y5);

    pot(x2,y1);
    pot(x2,y2);
    pot(x2,y3);
    pot(x2,y4);
    pot(x2,y5);

    pot(x3,y1);
    pot(x3,y2);
    pot(x3,y3);
    pot(x3,y4);
    pot(x3,y5);

    pot(x4,y1);
    pot(x4,y2);
    pot(x4,y3);
    pot(x4,y4);
    pot(x4,y5);

    sw(x1+dxsw,ysw1);
    sw(x2+dxsw,ysw1);
    sw(x3+dxsw,ysw1);
    sw(x4+dxsw,ysw1);
        
    sw(x1,ysw2);
    sw(x2,ysw2);
    sw(x3,ysw2);
    sw(x4,ysw2);
        
    drill(x1-dxjack,yjack,jackd);
    drill(x1+dxjack,yjack,jackd);
    drill(x2-dxjack,yjack,jackd);
    drill(x2+dxjack,yjack,jackd);
    drill(x3-dxjack,yjack,jackd);
    drill(x3+dxjack,yjack,jackd);
    drill(x4-dxjack,yjack,jackd);
    drill(x4+dxjack,yjack,jackd);
        
    drill(xm,7.376,.169);

}

    