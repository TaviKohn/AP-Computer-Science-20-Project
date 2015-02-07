import peasy.*;
import controlP5.*;
int mode = 0;

ControlP5 cp5;
PeasyCam cam;

color elementColor = #123ABC;
color background = #000000;
int tabWidth = 50;
int xL, yL, zL, tL = 0;
Group settings;
Tab arrayTab1D;
Tab arrayTab2D;
Tab arrayTab3D;
Tab arrayTab4D;
DropdownList arrayTypeDropdown;

ArrayList<Object> arrayList1D = new ArrayList<Object>();
ArrayList<ArrayList<Object>> arrayList2D = new ArrayList<ArrayList<Object>>();
ArrayList<ArrayList<ArrayList<Object>>> arrayList3D = new ArrayList<ArrayList<ArrayList<Object>>>();
ArrayList<ArrayList<ArrayList<ArrayList<Object>>>> arrayList4D = new ArrayList<ArrayList<ArrayList<ArrayList<Object>>>>();

void setup() {
  size(600, 400, P3D);
  background(150);
  noStroke();
  fill(elementColor);
  cp5 = new ControlP5(this);
  cam = new PeasyCam(this, 100);
  initLists();
  initGUI();
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
    break; 
  case 3 : 
    //4D Array?
    break;
  }
  gui();
}

void gui() {
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

void initGUI() {
  draw();

  cp5.tab("default").remove();

  arrayTab1D = cp5.addTab("1D Array");
  arrayTab1D.setWidth(tabWidth);
  arrayTab1D.bringToFront();
  arrayTab1D.activateEvent(true);

  arrayTab2D = cp5.addTab("2D Array");
  arrayTab2D.setWidth(tabWidth);

  arrayTab3D = cp5.addTab("3D Array");
  arrayTab3D.setWidth(tabWidth);

  arrayTab4D = cp5.addTab("4D Array?");
  arrayTab4D.setWidth(tabWidth);
  
  settings = cp5.addGroup("Array Settings");
  settings.setPosition(0,100);
  settings.setBackgroundHeight(150);

  arrayTypeDropdown = cp5.addDropdownList("Array Type");
  arrayTypeDropdown.setPosition(2, 100);
  arrayTypeDropdown.addItems(new String[] {
    "String", "int", "Double", "boolean"
  }
  );
  arrayTypeDropdown.setIndex(0);
  arrayTypeDropdown.setGroup(settings);

  cp5.setAutoDraw(false);
}

void controlEvent(ControlEvent theEvent) {

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}

