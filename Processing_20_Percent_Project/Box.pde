public class Box {
  private HEC_Box box;
  private HE_Mesh mesh;
  private boolean booleanValue;
  private int intValue;
  private double doubleValue;
  private String stringValue;
  private int xN;
  private int yN;
  private int zN;
  private int tN;

  public Box(int xN, int yN, int zN, int tN) {
    this.xN = xN;
    this.yN = yN;
    this.zN = zN;
    this.tN = tN;
    box = boxCreatorFactory(xN, yN, zN);
    mesh=new HE_Mesh(box);
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
}
