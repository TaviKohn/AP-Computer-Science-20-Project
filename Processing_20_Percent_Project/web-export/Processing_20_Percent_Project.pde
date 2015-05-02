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
  frameRate(25);
  smooth(4);
  //noSmooth();
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
public class Boxen { //<>//
  int xN = 1;
  int yN = 1;
  int zN = 1;
  int tN = 1;

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
    //Box box = new Box(0, 0, 0, 0);
    //tree = new WB_AABBTree(box.getMesh(), 4);
    //render = new WB_Render3D(applet);
    //selrender=new WB_SelectRender3D(applet);
    //resizeBoxenArray(xN, yN, zN, tN);
  }

  private void resizeBoxenArray(int xD, int yD, int zD, int tD) {
    xN = xD;
    yN = yD;
    zN = zD;
    tN = tD;
    boxen = new ArrayList<Voxel>();
    switch(mode) {
    case 1:
      for (int ix = 0; ix < xN; ix++) {
        println("Initializing a Box in a 1D Array");
        boxen.add(new Voxel(ix * 50 - (xN - 1) * 25, 0, 0, 0));
      }
      cam.setMinimumDistance(50 * xN);
      cam.setMaximumDistance(150 * xN);
      break;
    case 2:
      for (int ix = 0; ix < xN; ix++) {
        for (int iy = 0; iy < yN; iy++) {
          println("Initializing a Box in a 2D Array");
          boxen.add(new Voxel(ix * 50 - (xN - 1) * 25, iy * 50 - (yN - 1) * 25, 0, 0));
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
            println("Initializing a Box in a 3D Array");
            boxen.add(new Voxel(ix * 150 - (xN - 1) * 75, iy * 150 - (yN - 1) * 75, iz * 150 - (zN - 1) * 75, 0));
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
      for (int ix = 0; ix < xN; ix++) {
        for (int iy = 0; iy < yN; iy++) {
          for (int iz = 0; iy < zN; iz++) {
            for (int it = 0; it < tN; it++) {
              println("Initializing a Box in a 4D Array");
              boxen.add(new Voxel(ix * 100 - (xN - 1) * 50, iy * 100 - (yN - 1) * 50, iz * 100 - (zN - 1) * 50, it * 100 - (tN - 1) * 50));
            }
          }
        }
      }
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
    }
  }

  public void mouseClicked() {
    //HE_Face f;
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
      Shape3D picked = Shape3D.pickShape(applet, mouseX, mouseY);
      if (picked != null) {
        for(Voxel boxi : boxen) {
          if(picked == boxi.getBox()) boxi.booleanValue = !boxi.getBooleanValue();
        }
      }
      break;
    case 1:  //int
      break;
    case 2:  //double
      break;
    case 3:  //string
      break;
    }
  }

  public void draw() {
    for (Voxel boxi : boxen) {
      boxi.draw();
      //noStroke();
      //render.drawFaces(boxi.getMesh());
      //stroke(0);
      //render.drawEdges(boxi.getMesh());
    }
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
  private int mode = 3;
  private boolean arraySizeUpdate = false;
  private Tab arrayTab1D;
  private Tab arrayTab2D;
  private Tab arrayTab3D;
  private Tab arrayTab4D;
  private color background = #888888;
  private color groupBackground = #AAAAAA;

  private int tabWidth = displayWidth / 4;
  private int tabHeight = 2 * fontHeight;
  private int settingsGroupWidth = tabWidth;
  private int settingsBarHeight = (int)(fontHeight * 1.5);
  private int settingsGroupHeight = (int)(displayHeight * 0.75);
  private int dropdownWidth = settingsGroupWidth - fontHeight * 2;
  private int dropdownBarHeight = (int)(fontHeight * 1.5);
  private int dropdownHeight = displayHeight / 2;
  private int dropdownItemHeight = fontHeight * 2;
  private int arraySizeWidth = fontHeight * 10;
  private int arraySizeHeight = (int)(fontHeight * 1.5);

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
  private int settingsY = (int)(fontHeight * 3.7);

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
    cam.setMinimumDistance(100);
    cam.setMaximumDistance(1000);
    stroke(#FFFFFF);

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
    arraySizeXNumberbox.setRange(1, 10);
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
    arraySizeYNumberbox.setRange(1, 10);
    arraySizeYNumberbox.setValue(1);
    arraySizeYNumberbox.setGroup(settings2D);

    arraySizeZNumberbox = cp5.addNumberbox("arraySizeZNumberbox");
    arraySizeZNumberbox.setPosition(arraySizeZNumberboxX, arraySizeZNumberboxY);
    arraySizeZNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeZNumberbox.setCaptionLabel("Array Size Z");
    arraySizeZNumberbox.setRange(1, 10);
    arraySizeZNumberbox.setValue(1);
    arraySizeZNumberbox.setGroup(settings3D);

    arraySizeTNumberbox = cp5.addNumberbox("arraySizeTNumberbox");
    arraySizeTNumberbox.setPosition(arraySizeTNumberboxX, arraySizeTNumberboxY);
    arraySizeTNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeTNumberbox.setCaptionLabel("Array Size T");
    arraySizeTNumberbox.setRange(1, 10);
    arraySizeTNumberbox.setValue(1);
    arraySizeTNumberbox.setGroup(settings4D);

    //settings1D.moveTo(arrayTab1D);
    //settings2D.moveTo(arrayTab2D);
    //settings3D.moveTo(arrayTab3D);
    //settings4D.moveTo(arrayTab4D);
    //settings1D.moveTo(arrayTab1D);

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

  public void setMode(int mode) {
    this.mode = mode;
  }

  public PeasyCam getCam() {
    return cam;
  }

  public color getBackgroundColor() {
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
  private boolean booleanValue;
  private int intValue;
  private double doubleValue;
  private String stringValue;
  private int xN;
  private int yN;
  private int zN;
  private int tN;

  public Voxel(int xN, int yN, int zN, int tN) {
    this.xN = xN;
    this.yN = yN;
    this.zN = zN;
    this.tN = tN;
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

  public void moveTo(int xN, int yN, int zN, int tN) {
    this.xN = xN;
    this.yN = yN;
    this.zN = zN;
    this.tN = tN;
    box.moveTo(xN, yN, zN);
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

