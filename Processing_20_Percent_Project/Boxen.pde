import wblut.hemesh.*;
import wblut.geom.*;
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;

int xN = 5;
int yN = 0;
int zN = 0;
int tN = 0;

int selectedBox;

int timer = 0;

ArrayList<HE_Mesh> arrayList1DBoxen = new ArrayList<HE_Mesh>();
ArrayList<ArrayList<HE_Mesh>> arrayList2DBoxen = new ArrayList<ArrayList<HE_Mesh>>();
ArrayList<ArrayList<ArrayList<HE_Mesh>>> arrayList3DBoxen = new ArrayList<ArrayList<ArrayList<HE_Mesh>>>();
ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>> arrayList4DBoxen = new ArrayList<ArrayList<ArrayList<ArrayList<HE_Mesh>>>>();
ArrayList<HE_Mesh> boxen = new ArrayList<HE_Mesh>();

HE_Mesh box;
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
    boxCreator = createBoxCreator(0, 0, 0);
    box = new HE_Mesh(boxCreator);
    tree = new WB_AABBTree(box, 1);
    selection = new HE_Selection(box);
    render = new WB_Render3D(applet);
  }
  
  private HEC_Box createBoxCreator(int x, int y, int z){
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

  public void resizeBoxenArray(int xL, int yL, int zL, int tL) {
    xN = xL;
    yN = yL;
    zN = zL;
    tN = tL;
    switch(mode) {
    case 1:
      for (int i = 0; i < xL; i++) {
        boxen.add(new HE_Mesh(createBoxCreator(100 - i * 50, 0, 0)));
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
    
  }

  public void draw() {
    resizeBoxenArray(xN, yN, zN, tN);
    background(0);
    fill(255, 0, 0);
    noStroke();
    fill(#FF0000);
    HE_Face f;
    for (HE_Mesh boxi : boxen) {
      HE_Face fTemp = render.pickClosestFace(boxi, mouseX, mouseY);
        f = fTemp;
        println(f);
      if(fTemp !=null && f != null){
       fill(#00FF00); 
      } else {
       fill(#FF0000); 
      }
      noStroke();
      render.drawFaces(boxi);
      stroke(0);
      render.drawEdges(boxi);
      println(f);
      f = fTemp;
    }
  }
}
