import java.util.Arrays;
import controlP5.*;
/*
import wblut.hemesh.*;
 import wblut.geom.*;
 import wblut.math.*;
 import wblut.processing.*;
 import wblut.core.*;
 */
/*TODO
 *
 *Make a popup box for modifying values in voxels
 *
 *Fix broken box storage management
 */
import shapes3d.*;
import shapes3d.utils.*;
import shapes3d.animation.*;

import peasy.*;
PApplet applet;

GUI gui;
Boxen cubes;

PeasyCam cam;

int debugCounter;

int xL = 1;
int yL = 1;
int zL = 1;
int tL = 1;
final int maxSizeX = 2;
final int maxSizeY = 2;
final int maxSizeZ = 2;
final int maxSizeT = 1;
int mode = 4;
int dataMode = 0;

ArrayList<ArrayList<ArrayList<ArrayList<Voxel>>>> multiDimensionalArrayList = new ArrayList<ArrayList<ArrayList<ArrayList<Voxel>>>>();


void setup() {
  size(displayWidth, displayHeight, P3D);
  applet = this;
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
  println("Initializing lists");
  initLists();
  println("Finished :\t" + (double)(millis() - timeMarker) / 1000  + "s");
  println("Initializing Boxen");
  cubes = new Boxen();
  println("Finished :\t" + (double)(millis() - timeMarker) / 1000  + "s");
  println("Setting up 3D Applet Framerate, Antialiasing and Lights");
  frameRate(5);
  smooth(4);
  //noSmooth();
  //lights();
  println("Finished :\t" + (double)(millis() - timeMarker) / 1000  + "s");
}

void draw() {
  //xL = arrayList1D.size();
  //yL = arrayList2D.get(0).size();
  //zL = arrayList3D.get(0).get(0).size();
  //mode = 4 - mode;
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
  println("multiDimensionalArrayList.toString():\t" + multiDimensionalArrayList.toString());
  pushMatrix();
  println("Drawing boxen");
  cubes.draw();
  println("Number of boxes in multiDimensionalArrayList:" + multiDimensionalArrayList.size() * multiDimensionalArrayList.get(0).size() * multiDimensionalArrayList.get(0).get(0).size() * multiDimensionalArrayList.get(0).get(0).get(0).size());
  popMatrix();
  println("Drawing GUI");
  gui.draw();
}

void initLists() {
  ArrayList<Voxel> temp1DArrayList = new ArrayList<Voxel>();
  ArrayList<ArrayList<Voxel>> temp2DArrayList = new ArrayList<ArrayList<Voxel>>();
  ArrayList<ArrayList<ArrayList<Voxel>>> temp3DArrayList = new ArrayList<ArrayList<ArrayList<Voxel>>>();

  for (int it = 0; it < maxSizeT; it++) {
    temp1DArrayList.add(new Voxel(0, 0, 0, 0));
  }
  for (int iz = 0; iz < maxSizeZ; iz++) {
    temp2DArrayList.add((ArrayList<Voxel>)temp1DArrayList.clone());
  }

  for (int iy = 0; iy < maxSizeY; iy++) {
    temp3DArrayList.add((ArrayList<ArrayList<Voxel>>)temp2DArrayList.clone());
  }
  for (int ix = 0; ix < maxSizeX; ix++) {
    multiDimensionalArrayList.add((ArrayList<ArrayList<ArrayList<Voxel>>>)temp3DArrayList.clone());
  }

  for (int ix = 0; ix < maxSizeX; ix++) {
    for (int iy = 0; iy < maxSizeY; iy++) {
      for (int iz = 0; iz < maxSizeZ; iz++) {
        for (int it = 0; it < maxSizeT; it++) {
          multiDimensionalArrayList.get(ix).get(iy).get(iz).set(it, new Voxel(ix * 100 - (maxSizeX - 1) * 50, iy * 100 - (maxSizeY - 1) * 50, iz * 100 - (maxSizeZ - 1) * 50, iz * 100 - (maxSizeZ - 1) * 50));
          //println("Box Created at:\tX: " + (ix * 100 - (maxSizeX - 1) * 50) + "\tY: " + (iy * 100 - (maxSizeY - 1) * 50) + "\tZ: " + (iz * 100 - (maxSizeZ - 1) * 50) + "\tT: " + (iz * 100 - (maxSizeZ - 1) * 50));
          println("For loop local variables:\tix: " + ix + "\tiy: " + iy + "\tiz: " + iz + "\tit: " + it);
          multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).setRender(true);
        }
      }
    }
  }

  temp1DArrayList = null;
  temp2DArrayList = null;
  temp3DArrayList = null;
  println("X size: " + multiDimensionalArrayList.size());
  println("Y size: " + multiDimensionalArrayList.get(0).size());
  println("Z size: " + multiDimensionalArrayList.get(0).get(0).size());
  println("T size: " + multiDimensionalArrayList.get(0).get(0).get(0).size());
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
