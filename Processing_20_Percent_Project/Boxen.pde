import wblut.hemesh.*;
import wblut.geom.*;
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;

int xN = 5;
int yN = 5;
int zN = 5;
int tN = 5;

int selectedBox;

int timer = 0;

ArrayList<HE_Mesh> arrayList1DBoxen = new ArrayList<HE_Mesh>();
ArrayList<ArrayList<HE_Mesh>> arrayList2DBoxen = new ArrayList<ArrayList<HE_Mesh>>();
ArrayList<ArrayList<ArrayList<HE_Mesh>>> arrayList3DBoxen = new ArrayList<ArrayList<ArrayList<HE_Mesh>>>();
ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>> arrayList4DBoxen = new ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>>();
ArrayList<Box> boxen = new ArrayList<Box>();

Box box;
HEC_Box boxCreator;
HE_Selection selection;
WB_SelectRender3D selrender;
WB_Render3D render;
WB_AABBTree tree;

public class Boxen {
  public Boxen(PApplet applet) {
    //xN = arrayList1DBoxen.size();
    //yN = arrayList2DBoxen.get(0).size();
    //zN = arrayList3DBoxen.get(0).get(0).size();
    box = new Box(0, 0, 0);
    tree = new WB_AABBTree(box.getMesh(), 1);
    selection = new HE_Selection(box.getMesh());
    render = new WB_Render3D(applet);
  }

  public void resizeBoxenArray(int xL, int yL, int zL, int tL) {
    xN = xL;
    yN = yL;
    zN = zL;
    tN = tL;
    switch(mode) {
    case 1:
      for (int i = 0; i < xN; i++) {
        boxen.add(new Box(100 - i * 50, 0, 0));
      }
      cam.setMinimumDistance(50 * xN);
      cam.setMaximumDistance(150 * xN);
      break;
    case 2:

    case 3:

    case 4:

      break;
    }
  }

  public void mouseClicked() {
    HE_Face f;
    for (Box boxi : boxen) {
      HE_Face fTemp = render.pickClosestFace(boxi.getMesh(), mouseX, mouseY);
      f = fTemp;
      fill(#FF0000);
      if (fTemp !=null && f != null) {
        boxi.setBooleanValue(true);
      } else {
        boxi.setBooleanValue(false);
      }
      if(boxi.getBooleanValue()) fill(#00FF00);
      noStroke();
      render.drawFaces(boxi.getMesh());
      stroke(0);
      render.drawEdges(boxi.getMesh());
      f = fTemp;
    }
  }

  public void draw() {
    resizeBoxenArray(5, 0, 0, 0);
    for (Box boxi : boxen) {
      fill(#FF0000);
      if(boxi.getBooleanValue()) fill(#00FF00);
      noStroke();
      render.drawFaces(boxi.getMesh());
      stroke(0);
      render.drawEdges(boxi.getMesh());
    }
  }
}
