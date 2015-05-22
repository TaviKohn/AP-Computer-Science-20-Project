import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Arrays; 
import controlP5.*; 
import shapes3d.*; 
import shapes3d.utils.*; 
import shapes3d.animation.*; 
import peasy.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Processing_20_Percent_Project extends PApplet {

 //<>//

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





PApplet applet;

GUI gui;
Boxen cubes;

PeasyCam cam;

int debugCounter;

int xL = 1;
int yL = 1;
int zL = 1;
int tL = 1;
final int maxSizeX = 5;
final int maxSizeY = 5;
final int maxSizeZ = 5;
final int maxSizeT = 1;
int mode = 4;
int dataMode = 0;

ArrayList<ArrayList<ArrayList<ArrayList<Voxel>>>> multiDimensionalArrayList = new ArrayList<ArrayList<ArrayList<ArrayList<Voxel>>>>();


public void setup() {
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
  frameRate(30);
  smooth(4);
  //noSmooth();
  //lights();
  println("Finished :\t" + (double)(millis() - timeMarker) / 1000  + "s");
}

public void draw() {
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
  //println("multiDimensionalArrayList.toString():\t" + multiDimensionalArrayList.toString());
  pushMatrix();
  println("Drawing boxen");
  cubes.draw();
  //println("Number of boxes in multiDimensionalArrayList:" + multiDimensionalArrayList.size() * multiDimensionalArrayList.get(0).size() * multiDimensionalArrayList.get(0).get(0).size() * multiDimensionalArrayList.get(0).get(0).get(0).size());
  popMatrix();
  println("Drawing GUI");
  gui.draw();
}

public void initLists() {
  xL = maxSizeX;
  yL = maxSizeY;
  zL = maxSizeZ;
  tL = maxSizeT;

  for (int ix = 0; ix < maxSizeX; ix++) {
    ArrayList<ArrayList<ArrayList<Voxel>>> temp3DArrayList = new ArrayList<ArrayList<ArrayList<Voxel>>>();
    for (int iy = 0; iy < maxSizeY; iy++) {
      ArrayList<ArrayList<Voxel>> temp2DArrayList = new ArrayList<ArrayList<Voxel>>();
      for (int iz = 0; iz < maxSizeZ; iz++) {
        ArrayList<Voxel> temp1DArrayList = new ArrayList<Voxel>();
        for (int it = 0; it < maxSizeT; it++) {
          temp1DArrayList.add(null);
        }
        temp2DArrayList.add(temp1DArrayList);
      }
      temp3DArrayList.add(temp2DArrayList);
    }
    multiDimensionalArrayList.add(temp3DArrayList);
  }

  for (int ix = 0; ix < maxSizeX; ix++) {
    for (int iy = 0; iy < maxSizeY; iy++) {
      for (int iz = 0; iz < maxSizeZ; iz++) {
        for (int it = 0; it < maxSizeT; it++) {
          int x = (ix * 100) - ((maxSizeX - 1) * 50);
          int y = (iy * 100) - ((maxSizeY - 1) * 50);
          int z = (iz * 100) - ((maxSizeZ - 1) * 50);
          int t = 0;
          multiDimensionalArrayList.get(ix).get(iy).get(iz).set(it, new Voxel(x, y, z, 0));
          multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).setRender(true);
          //println("Box Created at:\tX: " + (ix * 100 - (maxSizeX - 1) * 50) + "\tY: " + (iy * 100 - (maxSizeY - 1) * 50) + "\tZ: " + (iz * 100 - (maxSizeZ - 1) * 50) + "\tT: " + (iz * 100 - (maxSizeZ - 1) * 50));
          //println("For loop local variables:\tix: " + ix + "\tiy: " + iy + "\tiz: " + iz + "\tit: " + it);
          //println("Theoretical Box Location:\tX; " + x + "\tY: " + y + "\tZ: " + z + "\tT: " + t);
          //println("multiDimensionalArrayList.toString():\t" + multiDimensionalArrayList.toString());
          //println(multiDimensionalArrayList.get(ix).get(iy).get(iz).toString());
        }
      }
    }
  }

  //temp1DArrayList = null;
  //temp2DArrayList = null;
  //temp3DArrayList = null;
  println("X size: " + multiDimensionalArrayList.size());
  println("Y size: " + multiDimensionalArrayList.get(0).size());
  println("Z size: " + multiDimensionalArrayList.get(0).get(0).size());
  println("T size: " + multiDimensionalArrayList.get(0).get(0).get(0).size());
}

/*
void controlEvent(ControlEvent event) {
 if (event.isTab()) {
 cam.reset();
 mode = event.getTab().getId();
 println("TabEvent Happened\t" + event.getTab().getId());
 }
 }
 */

public void mouseClicked() {
  cubes.mouseClicked();
}

public void arraySizeXNumberbox(int value) {
  if (xL != value) {    //only update if the value on the slider changes
    println("arraySizeXNumberbox Updated to :\t" + value);
    cam.beginHUD();
    xL = value;
    cubes.resizeBoxenArray(xL, yL, zL, tL);
    cam.endHUD();
  }
}

public void arraySizeYNumberbox(int value) {
  if (yL != value) {    //only update if the value on the slider changes
    println("arraySizeYNumberbox Updated to :\t" + value);
    cam.beginHUD();
    yL = value;
    cubes.resizeBoxenArray(xL, yL, zL, tL);
    cam.endHUD();
  }
}

public void arraySizeZNumberbox(int value) {
  if (zL != value) {    //only update if the value on the slider changes
    println("arraySizeZNumberbox Updated to :\t" + value);
    cam.beginHUD();
    zL = value;
    cubes.resizeBoxenArray(xL, yL, zL, tL);
    cam.endHUD();
  }
}

public void arraySizeTNumberbox(int value) {
  if (tL != value) {    //only update if the value on the slider changes
    println("arraySizeTNumberbox Updated to :\t" + value);
    cam.beginHUD();
    tL = value;
    cubes.resizeBoxenArray(xL, yL, zL, tL);
    cam.endHUD();
  }
}
public class Boxen {
  int xN;
  int yN;
  int zN;
  int tN;

  int selectedBox;

  //ArrayList<HE_Mesh> arrayList1DBoxen = new ArrayList<HE_Mesh>();
  //ArrayList<ArrayList<HE_Mesh>> arrayList2DBoxen = new ArrayList<ArrayList<HE_Mesh>>();
  //ArrayList<ArrayList<ArrayList<HE_Mesh>>> arrayList3DBoxen = new ArrayList<ArrayList<ArrayList<HE_Mesh>>>();
  //ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>> arrayList4DBoxen = new ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>>();
  ArrayList<Voxel> boxen = new ArrayList<Voxel>();

  //HEC_Box boxCreator;
  //HE_Selection selection;
  //WB_SelectRender3D selrender;
  //WB_Render3D render;
  //WB_AABBTree tree;

  public Boxen() {
    //xN = arrayList1DBoxen.size();
    //yN = arrayList2DBoxen.get(0).size();
    //zN = arrayList3DBoxen.get(0).get(0).size();
    //Voxel box = new Voxel(0, 0, 0, 0);
    //tree = new WB_AABBTree(box.getMesh(), 4);
    //render = new WB_Render3D(applet);
    //selrender=new WB_SelectRender3D(applet);
    //resizeBoxenArray(1, 1, 1, 1);
  }

  private void resizeBoxenArray(int xD, int yD, int zD, int tD) {
    println("Beginning resizeBoxenArray()");
    xN = xD - 1;
    yN = yD - 1;
    zN = zD - 1;
    tN = tD - 1;

    for (int ix = 0; ix < multiDimensionalArrayList.size () && ix < maxSizeX; ix++) {
      for (int iy = 0; iy < multiDimensionalArrayList.get (ix).size() && iy < maxSizeY; iy++) {
        for (int iz = 0; iz < multiDimensionalArrayList.get (ix).get(iy).size() && iz < maxSizeZ; iz++) {
          for (int it = 0; it < multiDimensionalArrayList.get (ix).get(iy).get(iz).size() && it < maxSizeT; it++) {
            multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).setRender(false);
            //multiDimensionalArrayList.get(ix).get(0).get(0).get(0).setRender(true);
          }
        }
      }
    }
    //while(multiDimensionalArrayList.size()< xD) multiDimensionalArray.add(new ArrayList<ArrayList<ArrayList<Voxel>>>(0, 0, 0, 0));

    //boxen = new ArrayList<Voxel>();
    switch(mode) {
    case 1:
      for (int ix = 0; ix < xN; ix++) {
        //println("Initializing a Box in a 1D Array");
        //boxen.add(new Voxel(ix * 50 - (xN - 1) * 25, 0, 0, 0));
        multiDimensionalArrayList.get(ix).get(0).get(0).get(0).setRender(true);
      }
      cam.setMinimumDistance(50 * xN);
      cam.setMaximumDistance(150 * xN);
      break;
    case 2:
      for (int ix = 0; ix < xN; ix++) {
        for (int iy = 0; iy < yN; iy++) {
          //println("Initializing a Box in a 2D Array");
          //boxen.add(new Voxel(ix * 50 - (xN - 1) * 25, iy * 50 - (yN - 1) * 25, 0, 0));
          multiDimensionalArrayList.get(ix).get(iy).get(0).get(0).setRender(true);
        }
      }
      if (xN >= yN) {
        cam.setMinimumDistance(50 * xN);
        cam.setMaximumDistance(150 * xN);
      } else {
        cam.setMinimumDistance(50 * yN);
        cam.setMaximumDistance(150 * yN);
      }
      break;
    case 3:
      for (int ix = 0; ix < xN; ix++) {
        for (int iy = 0; iy < yN; iy++) {
          for (int iz = 0; iz < zN; iz++) {
            //println("Initializing a Box in a 3D Array");
            //boxen.add(new Voxel(ix * 150 - (xN - 1) * 75, iy * 150 - (yN - 1) * 75, iz * 150 - (zN - 1) * 75, 0));
            multiDimensionalArrayList.get(ix).get(iy).get(iz).get(0).setRender(true);
          }
        }
      }
      if (xN >= yN && xN >= zN) {
        cam.setMinimumDistance(150 * xN);
        cam.setMaximumDistance(500 * xN);
      } else if (yN >= zN && yN >= zN) {
        cam.setMinimumDistance(150 * yN);
        cam.setMaximumDistance(500 * yN);
      } else if (zN >= xN && zN >= yN) {
        cam.setMinimumDistance(150 * zN);
        cam.setMaximumDistance(500 * zN);
      }
      break;
    case 4:
      //try {
      for (int ix = 0; ix < multiDimensionalArrayList.size () && ix < xN; ix++) {
        for (int iy = 0; iy < multiDimensionalArrayList.get (ix).size() && iy < yN; iy++) {
          for (int iz = 0; iz < multiDimensionalArrayList.get (ix).get(iy).size() && iz < zN; iz++) {
            for (int it = 0; it < multiDimensionalArrayList.get (ix).get(iy).get(iz).size() && it < tN; it++) {
              //print("Initializing a Box in a 4D Array for the " + ++debugCounter + "th time\t ix = " + ix + "\tiy = " + iy + "\tiz = " + iz + "\tit = " + it);
              //boxen.add(new Voxel(ix * 100 - (xN - 1) * 50, iy * 100 - (yN - 1) * 50, iz * 100 - (zN - 1) * 50, it * 100 - (tN - 1) * 50));
              println("For loop local variables:\tix: " + ix + "\tiy: " + iy + "\tiz: " + iz + "\tit: " + it);
              multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).setRender(true);
            }
          }
        }
      }
      /*
    }
       catch(IndexOutOfBoundsException e) {
       println("IndexOutOfBoundsException in resizeBoxenArray() Caught");
       }
       */
      if (xN >= yN && xN >= zN && xN >= tN) {
        cam.setMinimumDistance(150 * xN);
        cam.setMaximumDistance(500 * xN);
      } else if (yN >= zN && yN >= zN && yN >= tN) {
        cam.setMinimumDistance(150 * yN);
        cam.setMaximumDistance(500 * yN);
      } else if (zN >= xN && zN >= yN && zN >= tN) {
        cam.setMinimumDistance(150 * zN);
        cam.setMaximumDistance(500 * zN);
      } else if (tN >= xN && tN >= yN && tN >= zN) {
        cam.setMinimumDistance(150 * tN);
        cam.setMaximumDistance(500 * tN);
      }
      break;
    default:
      println("Default condition in resizeBoxenArray() triggered. Check for incorrect mode variable");
      break;
    }
    //println("Boxen array size:\t\t\t" + boxen.size());
  }

  public void mouseClicked() {
    //HE_Face f;
    Shape3D picked = Shape3D.pickShape(applet, mouseX, mouseY);
    if (picked != null) {
      switch(dataMode) {
      case 0:  //boolean
        /*
      for (int i = 0; i < boxen.size (); i++) {
         tree = new WB_AABBTree(boxen.get(i).getMesh(), 1);
         f = render.pickClosestFace(boxen.get(i).getMesh(), mouseX, mouseY);
         if (f != null) {
         boxen.get(i).setBooleanValue(!boxen.get(i).getBooleanValue());
         }
         }
         */
        for (int ix = 0; ix < multiDimensionalArrayList.size (); ix++) {
          for (int iy = 0; iy < multiDimensionalArrayList.get (0).size(); iy++) {
            for (int iz = 0; iz < multiDimensionalArrayList.get (0).get(0).size(); iz++) {
              for (int it = 0; it < multiDimensionalArrayList.get (0).get(0).get(0).size(); it++) {
                println("For loop local variables:\tix: " + ix + "\tiy: " + iy + "\tiz: " + iz + "\tit: " + it);
                if (picked == multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).getBox() && multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).render) multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).setBooleanValue(!multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).getBooleanValue());
              }
            }
          }
        }
        break;
      case 1:
        //int popup
        break;
      case 2:
        //double popup
        break;
      case 3:
        //string popup
        break;
      }
    }
  }

  public void draw() {
    for (int ix = 0; ix < multiDimensionalArrayList.size (); ix++) {
      for (int iy = 0; iy < multiDimensionalArrayList.get (0).size(); iy++) {
        for (int iz = 0; iz < multiDimensionalArrayList.get (0).get(0).size(); iz++) {
          for (int it = 0; it < multiDimensionalArrayList.get (0).get(0).get(0).size(); it++) {
            if (multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).render) multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).draw();
          }
        }
      }
    }
    //println("cubes draw() called");
    //noStroke();
    //render.drawFaces(boxi.getMesh());
    //stroke(0);
    //render.drawEdges(boxi.getMesh());
  }
}
public class GUI {
  private ControlP5 cp5;
  private PeasyCam cam;
  private int fontHeight = 12;
  private PFont pfont = createFont("BankGothic-Medium-24.vlw", 24, false); // use true/false for smooth/no-smooth
  private ControlFont font = new ControlFont(pfont, fontHeight);
  private Group settings1D;
  private Group settings2D;
  private Group settings3D;
  private Group settings4D;
  private DropdownList arrayTypeDropdown;
  private Textlabel arrayTypeDropdownLabel;
  private Numberbox arraySizeXNumberbox;
  private Numberbox arraySizeYNumberbox;
  private Numberbox arraySizeZNumberbox;
  private Numberbox arraySizeTNumberbox;
  private Textlabel arraySizeLabel;
  private boolean arraySizeUpdate = false;
  private Tab arrayTab1D;
  private Tab arrayTab2D;
  private Tab arrayTab3D;
  private Tab arrayTab4D;
  private int background = 0xff888888;
  private int groupBackground = 0xffAAAAAA;

  private int tabWidth = displayWidth / 4;
  private int tabHeight = 2 * fontHeight;
  private int settingsGroupWidth = tabWidth;
  private int settingsBarHeight = (int)(fontHeight * 1.5f);
  private int settingsGroupHeight = (int)(displayHeight * 0.75f);
  private int dropdownWidth = settingsGroupWidth - fontHeight * 2;
  private int dropdownBarHeight = (int)(fontHeight * 1.5f);
  private int dropdownHeight = displayHeight / 2;
  private int dropdownItemHeight = fontHeight * 2;
  private int arraySizeWidth = fontHeight * 10;
  private int arraySizeHeight = (int)(fontHeight * 1.5f);

  private int arrayTypeLabelOffsetX = fontHeight;
  private int arrayTypeLabelOffsetY = -(fontHeight * 5);

  private int arrayTypeOffsetX = 0;
  private int arrayTypeOffsetY = fontHeight * 2;

  private int arraySizeLabelOffsetX = 0;
  private int arraySizeLabelOffsetY = fontHeight;

  private int arraySizeXNumberboxOffsetX = 0;
  private int arraySizeXNumberboxOffsetY = (int)(fontHeight * 2);

  private int arraySizeYNumberboxOffsetX = 0;
  private int arraySizeYNumberboxOffsetY = (int)(fontHeight * 4);

  private int arraySizeZNumberboxOffsetX = 0;
  private int arraySizeZNumberboxOffsetY = (int)(fontHeight * 4);

  private int arraySizeTNumberboxOffsetX = 0;
  private int arraySizeTNumberboxOffsetY = (int)(fontHeight * 4);

  private int settingsX = 0;
  private int settingsY = (int)(fontHeight * 3.7f);

  private int arrayTypeLabelX = settingsX + arrayTypeLabelOffsetX;
  private int arrayTypeLabelY = settingsY + settingsBarHeight + arrayTypeLabelOffsetY;

  private int arrayTypeX = arrayTypeLabelX + arrayTypeOffsetX;
  private int arrayTypeY = arrayTypeLabelY + fontHeight + arrayTypeOffsetY;

  private int arraySizeLabelX = arrayTypeX + arraySizeLabelOffsetX;
  private int arraySizeLabelY = arrayTypeY + arraySizeLabelOffsetY;

  private int arraySizeXNumberboxX = arraySizeLabelX + arraySizeXNumberboxOffsetX;
  private int arraySizeXNumberboxY = arraySizeLabelY + arraySizeXNumberboxOffsetY;

  private int arraySizeYNumberboxX = arraySizeXNumberboxX + arraySizeYNumberboxOffsetX;
  private int arraySizeYNumberboxY = arraySizeXNumberboxY + arraySizeYNumberboxOffsetY;

  private int arraySizeZNumberboxX = arraySizeYNumberboxX + arraySizeZNumberboxOffsetX;
  private int arraySizeZNumberboxY = arraySizeYNumberboxY + arraySizeZNumberboxOffsetY;

  private int arraySizeTNumberboxX = arraySizeZNumberboxX + arraySizeTNumberboxOffsetX;
  private int arraySizeTNumberboxY = arraySizeZNumberboxY + arraySizeTNumberboxOffsetY;

  public GUI(ControlP5 cp5, PeasyCam cam) {
    this.cp5 = cp5;
    this.cam = cam;
    cursor(CROSS);
    cam.setMinimumDistance(150 * 5);
    cam.setMaximumDistance(500 * 5);
    stroke(0xffFFFFFF);

    cp5.getDefaultTab().remove();
    cp5.setFont(font);

    arrayTab1D = cp5.addTab("1D Array");
    arrayTab1D.setId(1);
    arrayTab1D.setWidth(tabWidth);
    arrayTab1D.setHeight(tabHeight);
    arrayTab1D.setActive(true);

    arrayTab2D = cp5.addTab("2D Array");
    arrayTab2D.setId(2);
    arrayTab2D.setWidth(tabWidth);
    arrayTab2D.setHeight(tabHeight);

    arrayTab3D = cp5.addTab("3D Array");
    arrayTab3D.setId(3);
    arrayTab3D.setWidth(tabWidth);
    arrayTab3D.setHeight(tabHeight);

    arrayTab4D = cp5.addTab("4D Array");
    arrayTab4D.setId(4);
    arrayTab4D.setWidth(tabWidth);
    arrayTab4D.setHeight(tabHeight);

    settings1D = cp5.addGroup("settings1DGroup");
    settings1D.setPosition(settingsX, settingsY);
    settings1D.setWidth(settingsGroupWidth);
    settings1D.setBarHeight(settingsBarHeight);
    settings1D.setBackgroundHeight(settingsGroupHeight);
    settings1D.setLabel("Array Settings");
    settings1D.setBackgroundColor(groupBackground);
    settings1D.setMoveable(true);

    arraySizeLabel = cp5.addTextlabel("arraySizeLabel");
    arraySizeLabel.setPosition(arraySizeLabelX, arraySizeLabelY);
    arraySizeLabel.setText("ARRAY DIMENSIONS:");
    arraySizeLabel.setGroup(settings1D);

    arraySizeXNumberbox = cp5.addNumberbox("arraySizeXNumberbox");
    arraySizeXNumberbox.setPosition(arraySizeXNumberboxX, arraySizeXNumberboxY);
    arraySizeXNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeXNumberbox.setCaptionLabel("Array Size X");
    arraySizeXNumberbox.setRange(1, maxSizeX);
    arraySizeXNumberbox.setValue(1);
    arraySizeXNumberbox.setGroup(settings1D);

    arrayTypeDropdownLabel = cp5.addTextlabel("arrayTypeDropdownLabel");
    arrayTypeDropdownLabel.setPosition(arrayTypeLabelX, arrayTypeLabelY);
    arrayTypeDropdownLabel.setText("ARRAY TYPE:");
    arrayTypeDropdownLabel.setGroup(settings1D);

    arrayTypeDropdown = cp5.addDropdownList("Array Type");
    arrayTypeDropdown.setPosition(arrayTypeX, arrayTypeY);
    arrayTypeDropdown.setWidth(dropdownWidth);
    arrayTypeDropdown.setBarHeight(dropdownBarHeight);
    arrayTypeDropdown.setHeight(dropdownHeight);
    arrayTypeDropdown.setItemHeight(dropdownItemHeight);
    /*arrayTypeDropdown.addItems(new String[] {
     "boolean", "int", "Double", "String"
     }
     );*/
    arrayTypeDropdown.addItems(new String[] { 
      "boolean"
    }
    );
    arrayTypeDropdown.setIndex(0);
    arrayTypeDropdown.setGroup(settings1D);

    settings2D = settings1D;
    settings3D = settings1D;
    settings4D = settings1D;

    arraySizeYNumberbox = cp5.addNumberbox("arraySizeYNumberbox");
    arraySizeYNumberbox.setPosition(arraySizeYNumberboxX, arraySizeYNumberboxY);
    arraySizeYNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeYNumberbox.setCaptionLabel("Array Size Y");
    arraySizeYNumberbox.setRange(1, maxSizeY);
    arraySizeYNumberbox.setValue(1);
    arraySizeYNumberbox.setGroup(settings2D);

    arraySizeZNumberbox = cp5.addNumberbox("arraySizeZNumberbox");
    arraySizeZNumberbox.setPosition(arraySizeZNumberboxX, arraySizeZNumberboxY);
    arraySizeZNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeZNumberbox.setCaptionLabel("Array Size Z");
    arraySizeZNumberbox.setRange(1, maxSizeZ);
    arraySizeZNumberbox.setValue(1);
    arraySizeZNumberbox.setGroup(settings3D);

    arraySizeTNumberbox = cp5.addNumberbox("arraySizeTNumberbox");
    arraySizeTNumberbox.setPosition(arraySizeTNumberboxX, arraySizeTNumberboxY);
    arraySizeTNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeTNumberbox.setCaptionLabel("Array Size T");
    arraySizeTNumberbox.setRange(1, maxSizeT);
    arraySizeTNumberbox.setValue(1);
    arraySizeTNumberbox.setGroup(settings4D);

    settings1D.moveTo(arrayTab1D);
    settings2D.moveTo(arrayTab2D);
    settings3D.moveTo(arrayTab3D);
    settings4D.moveTo(arrayTab4D);
    settings1D.moveTo(arrayTab1D);

    cp5.setAutoDraw(false);
  }

  public void activateArrayTab1D() {
    settings1D.moveTo(arrayTab1D);
  }

  public void activateArrayTab2D() {
    settings2D.moveTo(arrayTab2D);
  }

  public void activateArrayTab3D() {
    settings3D.moveTo(arrayTab3D);
  }

  public void activateArrayTab4D() {
    settings4D.moveTo(arrayTab4D);
  }

  public void getSizeX() {
  }

  public void getSizeY() {
  }

  public void getSizeZ() {
  }

  public void getSizeT() {
  }

  public PeasyCam getCam() {
    return cam;
  }

  public int getBackgroundColor() {
    return background;
  }

  public void draw() {
    arraySizeUpdate = false;
    hint(DISABLE_DEPTH_TEST); 
    cam.beginHUD();
    cp5.draw();
    cam.endHUD(); 
    hint(ENABLE_DEPTH_TEST);
  }

  public boolean arraySizeUpdate() {
    return arraySizeUpdate;
  }
}
public class Voxel {
  //private HEC_Box box;
  //private HE_Mesh mesh;
  private Box box;
  public boolean render = false;
  private boolean booleanValue;
  private int intValue;
  private double doubleValue;
  private String stringValue;
  private int xN;
  private int yN;
  private int zN;
  private int tN;

  public Voxel(int x, int y, int z, int t) {
    xN = x;
    yN = y;
    zN = z;
    tN = t;
    box = new Box(applet, 30);
    box.drawMode(S3D.SOLID | S3D.WIRE);
    box.fill(0);
    moveTo(xN, yN, zN, tN);
    //box = boxCreatorFactory(xN, yN, zN);
    //mesh=new HE_Mesh(box);
  }

  public void setBooleanValue(boolean value) {
    booleanValue = value;
  }

  public void setIntValue(int value) {
    intValue = value;
  }

  public void setDoubleValue(double value) {
    doubleValue = value;
  }

  public void setStringValue(String value) {
    stringValue = value;
  }

  public int getXLocation() {
    return xN;
  }

  public int getYLocation() {
    return yN;
  }

  public int getZLocation() {
    return zN;
  }

  public int getTLocation() {
    return tN;
  }

  public boolean getBooleanValue() {
    return booleanValue;
  }

  public int getIntValue() {
    return intValue;
  }

  public double getDoubleValue() {
    return doubleValue;
  }

  public String getStringValue() {
    return stringValue;
  }

  public Box getBox() {
    return box;
  }

  public void moveTo(int x, int y, int z, int t) {
    xN = x;
    yN = y;
    zN = z;
    tN = t;
    box.moveTo(xN, yN, zN);
  }

  public void setRender(boolean render) {
    this.render = render;
  }

  public void setTagNo(int number) {
    box.tagNo = number;
  }

  public int getTagNo() {
    return box.tagNo;
  }

  public void draw() {
    if (booleanValue) box.fill(255);
    else box.fill(100);
    box.draw();
  }

  public String toString() {
    return "X: " + xN + "  Y: " + yN + "  Z: " + zN + "  T: " + tN + "  Render: " + render;
  }

  /*
  public HE_Mesh getMesh() {
   return mesh;
   }
   
   public HEC_Box getBox() {
   return box;
   }
   
   private HEC_Box boxCreatorFactory(int x, int y, int z) {
   HEC_Box creator = new HEC_Box();
   creator.setWidth(20);
   creator.setWidthSegments(1);
   creator.setHeight(20);
   creator.setHeightSegments(1);
   creator.setDepth(20);
   creator.setDepthSegments(1);
   creator.setCenter(x, y, z);
   return creator;
   }
   */
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "Processing_20_Percent_Project" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
