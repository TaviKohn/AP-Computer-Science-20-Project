import wblut.hemesh.*;
import wblut.geom.*;
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;

int xN = 0;
int yN = 0;
int zN = 0;
int tN = 0;

int selectedBox;

ArrayList<HE_Mesh> arrayList1DBoxen = new ArrayList<HE_Mesh>();
ArrayList<ArrayList<HE_Mesh>> arrayList2DBoxen = new ArrayList<ArrayList<HE_Mesh>>();
ArrayList<ArrayList<ArrayList<HE_Mesh>>> arrayList3DBoxen = new ArrayList<ArrayList<ArrayList<HE_Mesh>>>();
ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>> arrayList4DBoxen = new ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>>();
ArrayList<HE_Mesh> boxen = new ArrayList<HE_Mesh>();

HE_Mesh box;
HEC_Box boxCreator;
HE_Selection selection;
WB_Render3D render;
WB_AABBTree tree;

public class Boxen {
  public Boxen(PApplet applet) {
    //xN = arrayList1DBoxen.size();
    //yN = arrayList2DBoxen.get(0).size();
    //zN = arrayList3DBoxen.get(0).get(0).size();
    boxCreator = new HEC_Box();
    boxCreator.setWidth(20);
    boxCreator.setWidthSegments(1);
    boxCreator.setHeight(20);
    boxCreator.setHeightSegments(1);
    boxCreator.setDepth(20);
    boxCreator.setDepthSegments(1);
    boxCreator.setCenter(0, 0, 0);
    box = new HE_Mesh(boxCreator);
    tree = new WB_AABBTree(box, 4);
    selection = new HE_Selection(box);
    render = new WB_Render3D(applet);
  }

  public void resizeBoxenArray() {
    if(boxen.size() != 1){
     boxen.add(box); 
    }
  }

  public void draw() {
    resizeBoxenArray();
    background(0);
    fill(255, 0, 0);
    noStroke();
    fill(#FF0000);
    HE_Face f=render.pickClosestFace(tree, mouseX, mouseY);
    if (f!=null) {
      fill(#00FF00);
    }
    for (HE_Mesh boxi : boxen) {
      render.drawFaces(boxi);
      stroke(0);
      render.drawEdges(boxi);
    }
  }
}
