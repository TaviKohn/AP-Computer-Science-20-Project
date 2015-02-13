import controlP5.*;
import peasy.*;
GUI gui = new GUI(new ControlP5(this), new PeasyCam(this, 100));

int xL, yL, zL, tL = 0;

ArrayList<Object> arrayList1D = new ArrayList<Object>();
ArrayList<ArrayList<Object>> arrayList2D = new ArrayList<ArrayList<Object>>();
ArrayList<ArrayList<ArrayList<Object>>> arrayList3D = new ArrayList<ArrayList<ArrayList<Object>>>();
ArrayList<ArrayList<ArrayList<ArrayList<Object>>>> arrayList4D = new ArrayList<ArrayList<ArrayList<ArrayList<Object>>>>();

void setup() {
  size(displayWidth, displayHeight, P3D);
  initLists();
}

void draw() {
  xL = arrayList1D.size();
  yL = arrayList2D.get(0).size();
  zL = arrayList3D.get(0).get(0).size();
  switch(gui.getMode()) {
  case 0:
    //1D Array
    break; 
  case 1 : 
    //2D Array
    break; 
  case 2 : 
    //3D Array
    break; 
  case 3 : 
    //4D Array?
    break;
  }
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

