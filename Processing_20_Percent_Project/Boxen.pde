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

    for (int ix = 0; ix < multiDimensionalArrayList.size () && ix < xL; ix++) {
      for (int iy = 0; iy < multiDimensionalArrayList.get (ix).size() && iy < yL; iy++) {
        for (int iz = 0; iz < multiDimensionalArrayList.get (ix).get(iy).size() && iz < zL; iz++) {
          for (int it = 0; it < multiDimensionalArrayList.get (ix).get(iy).get(iz).size() && it < tL; it++) {
            multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).setRender(false);
          }
        }
      }
    }
    //while(multiDimensionalArrayList.size()< xD) multiDimensionalArray.add(new ArrayList<ArrayList<ArrayList<Voxel>>>(0, 0, 0, 0));

    //boxen = new ArrayList<Voxel>();
    switch(mode) {
    case 1:
      for (int ix = 0; ix < xN; ix++) {
        println("Initializing a Box in a 1D Array");
        //boxen.add(new Voxel(ix * 50 - (xN - 1) * 25, 0, 0, 0));
      }
      cam.setMinimumDistance(50 * xN);
      cam.setMaximumDistance(150 * xN);
      break;
    case 2:
      for (int ix = 0; ix < xN; ix++) {
        for (int iy = 0; iy < yN; iy++) {
          println("Initializing a Box in a 2D Array");
          //boxen.add(new Voxel(ix * 50 - (xN - 1) * 25, iy * 50 - (yN - 1) * 25, 0, 0));
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
            //boxen.add(new Voxel(ix * 150 - (xN - 1) * 75, iy * 150 - (yN - 1) * 75, iz * 150 - (zN - 1) * 75, 0));
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
      try {
        for (int ix = 0; ix < multiDimensionalArrayList.size () && ix < xN; ix++) {
          for (int iy = 0; iy < multiDimensionalArrayList.get (ix).size() && iy < yN; iy++) {
            for (int iz = 0; iz < multiDimensionalArrayList.get (ix).get(iy).size() && iz < zN; iz++) {
              for (int it = 0; it < multiDimensionalArrayList.get (ix).get(iy).get(iz).size() && it < tN; it++) {
                print("Initializing a Box in a 4D Array for the " + ++debugCounter + "th time\t ix = " + ix + "\tiy = " + iy + "\tiz = " + iz + "\tit = " + it);
                //boxen.add(new Voxel(ix * 100 - (xN - 1) * 50, iy * 100 - (yN - 1) * 50, iz * 100 - (zN - 1) * 50, it * 100 - (tN - 1) * 50));
                multiDimensionalArrayList.get(ix).get(iy).get(iz).get(it).setRender(true);
              }
            }
          }
        }
      }
      catch(IndexOutOfBoundsException e) {
        println("IndexOutOfBoundsException in resizeBoxenArray() Caught");
      }
      if (xN >= yN && xN >= zN && xN >= tN) {
        cam.setMinimumDistance(150 * xN);
        //cam.setMaximumDistance(500 * xN);
      } else if (yN >= zN && yN >= zN && yN >= tN) {
        cam.setMinimumDistance(150 * yN);
        //cam.setMaximumDistance(500 * yN);
      } else if (zN >= xN && zN >= yN && zN >= tN) {
        cam.setMinimumDistance(150 * zN);
        //cam.setMaximumDistance(500 * zN);
      } else if (tN >= xN && tN >= yN && tN >= zN) {
        cam.setMinimumDistance(150 * tN);
        //cam.setMaximumDistance(500 * tN);
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
    println("cubes draw() called");
    //noStroke();
    //render.drawFaces(boxi.getMesh());
    //stroke(0);
    //render.drawEdges(boxi.getMesh());
  }
}
