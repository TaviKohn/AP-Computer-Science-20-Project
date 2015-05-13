import controlP5.*;
/*
import wblut.hemesh.*;
import wblut.geom.*;
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
*/
import shapes3d.*;
import shapes3d.utils.*;
import shapes3d.animation.*;

import peasy.*;
PApplet applet;

GUI gui;
Boxen cubes;

PeasyCam cam;

int xL = 4;
int yL = 4;
int zL = 4;
int tL = 4;
int mode = 3;
int dataMode = 0;

ArrayList<Object> arrayList1D = new ArrayList<Object>();
ArrayList<ArrayList<Object>> arrayList2D = new ArrayList<ArrayList<Object>>();
ArrayList<ArrayList<ArrayList<Object>>> arrayList3D = new ArrayList<ArrayList<ArrayList<Object>>>();
ArrayList<ArrayList<ArrayList<ArrayList<Object>>>> arrayList4D = new ArrayList<ArrayList<ArrayList<ArrayList<Object>>>>();


void setup() {
  size(displayWidth, displayHeight, P3D);
  applet = this;
  initLists();
  //xL = arrayList1D.size();
  //yL = arrayList2D.get(0).size();
  //zL = arrayList3D.get(0).get(0).size();
  int timeMarker = millis();
  println("Initializing Camera");
  cam = new PeasyCam(this, 100);
  println("Finished :\t" + (double)(millis() - timeMarker) / 1000  + "s");
  println("Initializing GUI");
  gui = new GUI(new ControlP5(this), cam);
  println("Finished :\t" + (double)(millis() - timeMarker) / 1000  + "s");
  println("Initializing Boxen");
  cubes = new Boxen();
  println("Finished :\t" + (double)(millis() - timeMarker) / 1000  + "s");
  frameRate(30);
  smooth(8);
  lights();
}

void draw() {
  //xL = arrayList1D.size();
  //yL = arrayList2D.get(0).size();
  //zL = arrayList3D.get(0).get(0).size();
  background(gui.getBackgroundColor());
  switch(mode) {
  case 1:
    gui.activateArrayTab1D();
    //1D Array
    break; 
  case 2 :
    gui.activateArrayTab2D();
    //2D Array
    break; 
  case 3 :
    gui.activateArrayTab3D();
    //3D Array
    break; 
  case 4 :
    gui.activateArrayTab4D();
    //4D Array?
    break;
  }
  pushMatrix();
  cubes.draw();
  popMatrix();
  gui.draw();
}

void initLists() {
  ArrayList<Object> temp1DArrayList = new ArrayList<Object>();
  ArrayList<ArrayList<Object>> temp2DArrayList = new ArrayList<ArrayList<Object>>();
  ArrayList<ArrayList<ArrayList<Object>>> temp3DArrayList = new ArrayList<ArrayList<ArrayList<Object>>>();
  temp2DArrayList.add(temp1DArrayList);
  temp3DArrayList.add(temp2DArrayList);
  arrayList2D.add(temp1DArrayList);
  arrayList3D.add(temp2DArrayList);
  arrayList4D.add(temp3DArrayList);
  temp1DArrayList = null;
  temp2DArrayList = null;
  temp3DArrayList = null;
}

void controlEvent(ControlEvent event) {
  if (event.isTab()) {
    cam.reset();
    mode = event.getTab().getId();
    println("TabEvent Happened\t" + event.getTab().getId());
  }
}

void mouseClicked() {
  cubes.mouseClicked();
}

void arraySizeXNumberbox(int value) {
  if (xL != value) {    //only update if the value on the slider changes
    println("arraySizeXNumberbox Updated to :\t" + value);
    cam.beginHUD();
    xL = value;
    cubes.resizeBoxenArray(xL, yL, zL, tL);
    cam.endHUD();
  }
}

void arraySizeYNumberbox(int value) {
  if (yL != value) {    //only update if the value on the slider changes
    println("arraySizeYNumberbox Updated to :\t" + value);
    cam.beginHUD();
    yL = value;
    cubes.resizeBoxenArray(xL, yL, zL, tL);
    cam.endHUD();
  }
}

void arraySizeZNumberbox(int value) {
  if (zL != value) {    //only update if the value on the slider changes
    println("arraySizeZNumberbox Updated to :\t" + value);
    cam.beginHUD();
    zL = value;
    cubes.resizeBoxenArray(xL, yL, zL, tL);
    cam.endHUD();
  }
}

void arraySizeTNumberbox(int value) {
  if (tL != value) {    //only update if the value on the slider changes
    println("arraySizeTNumberbox Updated to :\t" + value);
    cam.beginHUD();
    tL = value;
    cubes.resizeBoxenArray(xL, yL, zL, tL);
    cam.endHUD();
  }
}
