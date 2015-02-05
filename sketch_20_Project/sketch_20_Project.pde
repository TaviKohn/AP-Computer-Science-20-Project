import peasy.*;
import controlP5.*;
int mode = 0;

ControlP5 cp5;
PeasyCam cam;

color elementColor = #123ABC;
color background = #000000;
int tabWidth = 50;
int xL, yL, zL, tL = 0;
ArrayList<Object> = arrayList1D;
ArrayList<ArrayList<Object>> = arrayList2D;
ArrayList<ArrayList<ArrayList<Object>>> + arrayList3D;
ArrayList<ArrayList<ArrayList<ArrayList<Object>>>> + arrayList4D;

xL = array1D.length();
yL = array2D[0].length();
zL = array3D[0][0].length();


void setup() {
  size(600, 400, P3D);
  noStroke();
  background(0);
  fill(elementColor);
  cp5 = new ControlP5(this);
  cam = new PeasyCam(this, 100);
  cp5.tab("default").remove();
  cp5.addTab("1D Array")
    .setWidth(tabWidth)
      .bringToFront()
        .activateEvent(true);
  ;
  cp5.addTab("2D Array")
    .setWidth(tabWidth)
      ;
  cp5.addTab("3D Array")
    .setWidth(tabWidth)
      ;
  cp5.addTab("4D Array?")
    .setWidth(tabWidth)
      ;
  cp5.setAutoDraw(false);
}

void draw() {
  switch(mode) {
  case 0:
    hint(DISABLE_DEPTH_TEST);
    cam.beginHUD();
    //1D Array
    cam.endHUD(); 
    hint(ENABLE_DEPTH_TEST); 
    break; 
  case 1 : 
    hint(DISABLE_DEPTH_TEST); 
    cam.beginHUD(); 
    //2D Array
    cam.endHUD(); 
    hint(ENABLE_DEPTH_TEST); 
    break; 
  case 2 : 
    //3D Array
    gui3D(); 
    break; 
  case 3 : 
    //4D Array?
    gui3D(); 
    break;
  }
}

void gui3D() {
  hint(DISABLE_DEPTH_TEST); 
  cam.beginHUD(); 
  cp5.draw(); 
  cam.endHUD(); 
  hint(ENABLE_DEPTH_TEST);
}

