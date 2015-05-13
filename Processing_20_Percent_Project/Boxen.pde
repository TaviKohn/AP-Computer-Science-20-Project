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
            boxen.add(new Voxel(ix * 100 - (xN - 1) * 50, iy * 100 - (yN - 1) * 50, iz * 100 - (zN - 1) * 50, 0));
          }
        }
      }
      if (xN >= yN && xN >= zN) {
        cam.setMinimumDistance(100 * xN);
        cam.setMaximumDistance(300 * xN);
      } else if (yN >= zN && yN >= zN) {
        cam.setMinimumDistance(100 * yN);
        cam.setMaximumDistance(300 * yN);
      } else if (zN >= xN && zN >= yN) {
        cam.setMinimumDistance(100 * zN);
        cam.setMaximumDistance(300 * zN);
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
        cam.setMinimumDistance(50 * xN);
        cam.setMaximumDistance(150 * xN);
      } else if (yN >= zN && yN >= zN && yN >= tN) {
        cam.setMinimumDistance(50 * yN);
        cam.setMaximumDistance(150 * yN);
      } else if (zN >= xN && zN >= yN && zN >= tN) {
        cam.setMinimumDistance(50 * zN);
        cam.setMaximumDistance(150 * zN);
      } else if (tN >= xN && tN >= yN && tN >= zN) {
        cam.setMinimumDistance(50 * tN);
        cam.setMaximumDistance(150 * tN);
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
