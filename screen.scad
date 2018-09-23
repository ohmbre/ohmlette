module knob(x,y,d=0.75) {
    color(c=[1,0,0,1])
        translate([x,y])
                circle(d=d,$fn=70);
}

module knobs() {
    knob(x1,y1,1);
    knob(x2,y1,1);
    knob(x3,y1,1);
    knob(x4,y1,1);
    knob(xm,1.66,1);
    knob(xm,3.05,1);
    knob(xm,4.705,1);
    knob(x1,y2); knob(x1,y3); knob(x1,y4); knob(x1,y5); knob(x1,y6);
    knob(x2,y2); knob(x2,y3); knob(x2,y4); knob(x2,y5); knob(x2,y6);
    knob(x3,y2); knob(x3,y3); knob(x3,y4); knob(x3,y5); knob(x3,y6);
    knob(x4,y2); knob(x4,y3); knob(x4,y4); knob(x4,y5); knob(x4,y6);
    knob(2.14,ysw1,9*mm);
    knob(4.24,ysw1,9*mm);
    knob(6.34,ysw1,9*mm);
    knob(8.44,ysw1,9*mm);
    knob(3.064,ysw2,9*mm);
    knob(5.164,ysw2,9*mm);
    knob(7.264,ysw2,9*mm);
    knob(9.364,ysw2,9*mm);
    knob(w-4.498,h-.473,.5);
    jk(1.981);
    jk(4.081);
    jk(6.181);
    jk(8.281);
    
    jk(2.574);
    jk(4.674);
    jk(6.774);
    jk(8.874);
    
}


mm = 0.0393701;



w=10.21;
h=7.874;
t=0.04;


module jk(x) {
    knob(x,6.785,12*mm);
}    

module label(x,y,txt,sz=0.2,align="center") {
    color(c=[0,0,0,1])
    translate([x,y])
    text(text=txt,size=sz, halign=align,valign="center",font="Copse");
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
chw = 2.1;

//knobs(); 


module phl(ch) {
    label(3.064+chw*(ch-1),ysw2+6*mm,"phono",.1);
    label(3.064+chw*(ch-1),ysw2-6.5*mm,"line",.1);
}
phl(1);phl(2);phl(3);phl(4);

module cue(ch) {
    label(2.14+chw*(ch-1),ysw1-6*mm,"cue",.1);
}

cue(1);cue(2);cue(3);cue(4);
    
label(xm,2.43,"booth");
label(xm,1,"phones");
label(xm,4.1,"house");

med=.13;
xpos = x1-.65;
label(xpos,y2,"low",med,"right");
label(xpos,(y3+y4)/2,"mid",med,"right");
label(xpos,y5,"high",med,"right");
label(xpos,y6,"input gain",med,"right");
module vline(x,y,height) {
    color("black") translate([x-.01,y-.01]) square([.02,height+.01]);
}
module hline(x,y,length) {
    color("black") translate([x,y-0.01]) square([length,.02]);
}

module arrow(x,y,angle) {
    translate([x,y])
    rotate(angle)
    color("black")
    polygon([[0,.1],[.1,0],[-.1,0]]);
}


module chlines(ch) {
x = x1 + chw*(ch-1);
lpos = x-.6;
vline(lpos,y2,4.01);
hline(lpos,y6,.5);
hline(lpos,y5,.5);
hline(lpos,y4,.5);
hline(lpos,y3,.5);
hline(lpos,y2,.5);

rpos=x+.1;
vline(rpos+.5,y1,4.16);
hline(rpos,y5,.5);
hline(rpos,y4,.5);
hline(rpos,y3,.5);
hline(rpos,y2,.5);
    //arrow(x-.38,y6,90);
    arrow(x-.46,y5,-90);
    arrow(x-.46,y4,-90);
    arrow(x-.46,y3,-90);
    arrow(x-.46,y2,-90);
    arrow(x+.6,y1+.1,180);
}
chlines(1);chlines(2);chlines(3);chlines(4);

hline(x1-.7,y1,7.6);
label(x1-.8,y1+.04,"mix",med,"right");
arrow(x1-.65,y1,90);

w=10.21;
h=7.874;
translate ([w,h]) circle(.02);
import(file="/home/gattis/Documents/ohmlette.dxf");
//label(w-.6,h-.3,"Ωhmlette",.25,"right");
label(w-.6,h-.5,"4-Channel DJ Mixer",med,"right");