import peasy.*;
import controlP5.*;
int mode = 0;

ControlP5 cp5;
PeasyCam cam;

color elementColor = #123ABC;
color background = #000000;
int tabWidth = 50;
int xL, yL, zL, tL = 0;

ArrayList<Object> arrayList1D = new ArrayList<Object>();
ArrayList<ArrayList<Object>> arrayList2D = new ArrayList<ArrayList<Object>>();
ArrayList<ArrayList<ArrayList<Object>>> arrayList3D = new ArrayList<ArrayList<ArrayList<Object>>>();
ArrayList<ArrayList<ArrayList<ArrayList<Object>>>> arrayList4D = new ArrayList<ArrayList<ArrayList<ArrayList<Object>>>>();

void setup() {
  size(600, 400, P3D);
  noStroke();
  background(0);
  fill(elementColor);
  initLists();
  cp5 = new ControlP5(this);
  cam = new PeasyCam(this, 100);
  draw();
  DropdownList arrayTypeDropdown = cp5.addDropdownList("Array Type");
  arrayTypeDropdown.setPosition(100, 100);
  arrayTypeDropdown.setItemHeight(20);
  arrayTypeDropdown.setBarHeight(15);
  arrayTypeDropdown.captionLabel().style().marginTop = 3;
  arrayTypeDropdown.captionLabel().style().marginLeft = 3;
  arrayTypeDropdown.valueLabel().style().marginTop = 3;
  arrayTypeDropdown.addItem("String", 0);
  arrayTypeDropdown.addItem("int", 1);
  arrayTypeDropdown.addItem("Double", 2);
  arrayTypeDropdown.addItem("boolean", 3);

  cp5.tab("default").remove();

  Tab ArrayTab1D = cp5.addTab("1D Array");
  ArrayTab1D.setWidth(tabWidth);
  ArrayTab1D.bringToFront();
  ArrayTab1D.activateEvent(true);

  Tab ArrayTab2D = cp5.addTab("2D Array");
  ArrayTab2D.setWidth(tabWidth);

  Tab ArrayTab3D = cp5.addTab("3D Array");
  ArrayTab3D.setWidth(tabWidth);

  Tab ArrayTab4D = cp5.addTab("4D Array?");
  ArrayTab4D.setWidth(tabWidth);

  cp5.setAutoDraw(false);
}

void draw() {
  xL = arrayList1D.size();
  yL = arrayList2D.get(0).size();
  zL = arrayList3D.get(0).get(0).size();
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
  gui3D();
}

void gui3D() {
  hint(DISABLE_DEPTH_TEST); 
  cam.beginHUD(); 
  cp5.draw(); 
  cam.endHUD(); 
  hint(ENABLE_DEPTH_TEST);
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

