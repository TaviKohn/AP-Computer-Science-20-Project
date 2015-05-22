public class Voxel {
  //private HEC_Box box;
  //private HE_Mesh mesh;
  private Box box;
  public boolean render = false;
  private boolean booleanValue;
  private int intValue;
  private double doubleValue;
  private String stringValue;
  private int xN;
  private int yN;
  private int zN;
  private int tN;

  public Voxel(int x, int y, int z, int t) {
    xN = x;
    yN = y;
    zN = z;
    tN = t;
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

  public void moveTo(int x, int y, int z, int t) {
    xN = x;
    yN = y;
    zN = z;
    tN = t;
    box.moveTo(xN, yN, zN);
  }

  public void setRender(boolean render) {
    this.render = render;
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

  public String toString() {
    return "X: " + xN + "  Y: " + yN + "  Z: " + zN + "  T: " + tN + "  Render: " + render;
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
