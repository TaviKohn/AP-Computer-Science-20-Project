import wblut.hemesh.*;
import wblut.geom.*;
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;

private int xN = 0;
private int yN = 0;
private int zN = 0;
private int tN = 0;

private int selectedBox;

private ArrayList<HE_Mesh> arrayList1DBoxen = new ArrayList<HE_Mesh>();
private ArrayList<ArrayList<HE_Mesh>> arrayList2DBoxen = new ArrayList<ArrayList<HE_Mesh>>();
private ArrayList<ArrayList<ArrayList<HE_Mesh>>> arrayList3DBoxen = new ArrayList<ArrayList<ArrayList<HE_Mesh>>>();
private ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>> arrayList4DBoxen = new ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>>();
//private ArrayList<HE_Mesh> boxen = new ArrayList<HE_MESH>();

private HE_Mesh box;
private HEC_Box boxCreator;
private HE_Selection selection;
private WB_Render3D render;
private WB_AABBTree tree;

public class Boxen {
  public void Boxen(PApplet applet) {
    xN = arrayList1DBoxen.size();
    yN = arrayList2DBoxen.get(0).size();
    zN = arrayList3DBoxen.get(0).get(0).size();
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
