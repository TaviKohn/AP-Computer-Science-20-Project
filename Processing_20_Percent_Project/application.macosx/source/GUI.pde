public class GUI {
  private ControlP5 cp5;
  private PeasyCam cam;
  private int fontHeight = 12;
  private PFont pfont = createFont("BankGothic-Medium-24.vlw", 24, false); // use true/false for smooth/no-smooth
  private ControlFont font = new ControlFont(pfont, fontHeight);
  private Group settings1D;
  private Group settings2D;
  private Group settings3D;
  private Group settings4D;
  private DropdownList arrayTypeDropdown;
  private Textlabel arrayTypeDropdownLabel;
  private Numberbox arraySizeXNumberbox;
  private Numberbox arraySizeYNumberbox;
  private Numberbox arraySizeZNumberbox;
  private Numberbox arraySizeTNumberbox;
  private Textlabel arraySizeLabel;
  private boolean arraySizeUpdate = false;
  private Tab arrayTab1D;
  private Tab arrayTab2D;
  private Tab arrayTab3D;
  private Tab arrayTab4D;
  private color background = #888888;
  private color groupBackground = #AAAAAA;

  private int tabWidth = displayWidth / 4;
  private int tabHeight = 2 * fontHeight;
  private int settingsGroupWidth = tabWidth;
  private int settingsBarHeight = (int)(fontHeight * 1.5);
  private int settingsGroupHeight = (int)(displayHeight * 0.75);
  private int dropdownWidth = settingsGroupWidth - fontHeight * 2;
  private int dropdownBarHeight = (int)(fontHeight * 1.5);
  private int dropdownHeight = displayHeight / 2;
  private int dropdownItemHeight = fontHeight * 2;
  private int arraySizeWidth = fontHeight * 10;
  private int arraySizeHeight = (int)(fontHeight * 1.5);

  private int arrayTypeLabelOffsetX = fontHeight;
  private int arrayTypeLabelOffsetY = -(fontHeight * 5);

  private int arrayTypeOffsetX = 0;
  private int arrayTypeOffsetY = fontHeight * 2;

  private int arraySizeLabelOffsetX = 0;
  private int arraySizeLabelOffsetY = fontHeight;

  private int arraySizeXNumberboxOffsetX = 0;
  private int arraySizeXNumberboxOffsetY = (int)(fontHeight * 2);

  private int arraySizeYNumberboxOffsetX = 0;
  private int arraySizeYNumberboxOffsetY = (int)(fontHeight * 4);

  private int arraySizeZNumberboxOffsetX = 0;
  private int arraySizeZNumberboxOffsetY = (int)(fontHeight * 4);

  private int arraySizeTNumberboxOffsetX = 0;
  private int arraySizeTNumberboxOffsetY = (int)(fontHeight * 4);

  private int settingsX = 0;
  private int settingsY = (int)(fontHeight * 3.7);

  private int arrayTypeLabelX = settingsX + arrayTypeLabelOffsetX;
  private int arrayTypeLabelY = settingsY + settingsBarHeight + arrayTypeLabelOffsetY;

  private int arrayTypeX = arrayTypeLabelX + arrayTypeOffsetX;
  private int arrayTypeY = arrayTypeLabelY + fontHeight + arrayTypeOffsetY;

  private int arraySizeLabelX = arrayTypeX + arraySizeLabelOffsetX;
  private int arraySizeLabelY = arrayTypeY + arraySizeLabelOffsetY;

  private int arraySizeXNumberboxX = arraySizeLabelX + arraySizeXNumberboxOffsetX;
  private int arraySizeXNumberboxY = arraySizeLabelY + arraySizeXNumberboxOffsetY;

  private int arraySizeYNumberboxX = arraySizeXNumberboxX + arraySizeYNumberboxOffsetX;
  private int arraySizeYNumberboxY = arraySizeXNumberboxY + arraySizeYNumberboxOffsetY;

  private int arraySizeZNumberboxX = arraySizeYNumberboxX + arraySizeZNumberboxOffsetX;
  private int arraySizeZNumberboxY = arraySizeYNumberboxY + arraySizeZNumberboxOffsetY;

  private int arraySizeTNumberboxX = arraySizeZNumberboxX + arraySizeTNumberboxOffsetX;
  private int arraySizeTNumberboxY = arraySizeZNumberboxY + arraySizeTNumberboxOffsetY;

  public GUI(ControlP5 cp5, PeasyCam cam) {
    this.cp5 = cp5;
    this.cam = cam;
    cursor(CROSS);
    cam.setMinimumDistance(150 * 5);
    cam.setMaximumDistance(500 * 5);
    stroke(#FFFFFF);

    cp5.getDefaultTab().remove();
    cp5.setFont(font);

    arrayTab1D = cp5.addTab("1D Array");
    arrayTab1D.setId(1);
    arrayTab1D.setWidth(tabWidth);
    arrayTab1D.setHeight(tabHeight);
    arrayTab1D.setActive(true);

    arrayTab2D = cp5.addTab("2D Array");
    arrayTab2D.setId(2);
    arrayTab2D.setWidth(tabWidth);
    arrayTab2D.setHeight(tabHeight);

    arrayTab3D = cp5.addTab("3D Array");
    arrayTab3D.setId(3);
    arrayTab3D.setWidth(tabWidth);
    arrayTab3D.setHeight(tabHeight);

    arrayTab4D = cp5.addTab("4D Array");
    arrayTab4D.setId(4);
    arrayTab4D.setWidth(tabWidth);
    arrayTab4D.setHeight(tabHeight);

    settings1D = cp5.addGroup("settings1DGroup");
    settings1D.setPosition(settingsX, settingsY);
    settings1D.setWidth(settingsGroupWidth);
    settings1D.setBarHeight(settingsBarHeight);
    settings1D.setBackgroundHeight(settingsGroupHeight);
    settings1D.setLabel("Array Settings");
    settings1D.setBackgroundColor(groupBackground);
    settings1D.setMoveable(true);

    arraySizeLabel = cp5.addTextlabel("arraySizeLabel");
    arraySizeLabel.setPosition(arraySizeLabelX, arraySizeLabelY);
    arraySizeLabel.setText("ARRAY DIMENSIONS:");
    arraySizeLabel.setGroup(settings1D);

    arraySizeXNumberbox = cp5.addNumberbox("arraySizeXNumberbox");
    arraySizeXNumberbox.setPosition(arraySizeXNumberboxX, arraySizeXNumberboxY);
    arraySizeXNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeXNumberbox.setCaptionLabel("Array Size X");
    arraySizeXNumberbox.setRange(1, maxSizeX);
    arraySizeXNumberbox.setValue(1);
    arraySizeXNumberbox.setGroup(settings1D);

    arrayTypeDropdownLabel = cp5.addTextlabel("arrayTypeDropdownLabel");
    arrayTypeDropdownLabel.setPosition(arrayTypeLabelX, arrayTypeLabelY);
    arrayTypeDropdownLabel.setText("ARRAY TYPE:");
    arrayTypeDropdownLabel.setGroup(settings1D);

    arrayTypeDropdown = cp5.addDropdownList("Array Type");
    arrayTypeDropdown.setPosition(arrayTypeX, arrayTypeY);
    arrayTypeDropdown.setWidth(dropdownWidth);
    arrayTypeDropdown.setBarHeight(dropdownBarHeight);
    arrayTypeDropdown.setHeight(dropdownHeight);
    arrayTypeDropdown.setItemHeight(dropdownItemHeight);
    /*arrayTypeDropdown.addItems(new String[] {
     "boolean", "int", "Double", "String"
     }
     );*/
    arrayTypeDropdown.addItems(new String[] { 
      "boolean"
    }
    );
    arrayTypeDropdown.setIndex(0);
    arrayTypeDropdown.setGroup(settings1D);

    settings2D = settings1D;
    settings3D = settings1D;
    settings4D = settings1D;

    arraySizeYNumberbox = cp5.addNumberbox("arraySizeYNumberbox");
    arraySizeYNumberbox.setPosition(arraySizeYNumberboxX, arraySizeYNumberboxY);
    arraySizeYNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeYNumberbox.setCaptionLabel("Array Size Y");
    arraySizeYNumberbox.setRange(1, maxSizeY);
    arraySizeYNumberbox.setValue(1);
    arraySizeYNumberbox.setGroup(settings2D);

    arraySizeZNumberbox = cp5.addNumberbox("arraySizeZNumberbox");
    arraySizeZNumberbox.setPosition(arraySizeZNumberboxX, arraySizeZNumberboxY);
    arraySizeZNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeZNumberbox.setCaptionLabel("Array Size Z");
    arraySizeZNumberbox.setRange(1, maxSizeZ);
    arraySizeZNumberbox.setValue(1);
    arraySizeZNumberbox.setGroup(settings3D);

    arraySizeTNumberbox = cp5.addNumberbox("arraySizeTNumberbox");
    arraySizeTNumberbox.setPosition(arraySizeTNumberboxX, arraySizeTNumberboxY);
    arraySizeTNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeTNumberbox.setCaptionLabel("Array Size T");
    arraySizeTNumberbox.setRange(1, maxSizeT);
    arraySizeTNumberbox.setValue(1);
    arraySizeTNumberbox.setGroup(settings4D);

    settings1D.moveTo(arrayTab1D);
    settings2D.moveTo(arrayTab2D);
    settings3D.moveTo(arrayTab3D);
    settings4D.moveTo(arrayTab4D);
    settings1D.moveTo(arrayTab1D);

    cp5.setAutoDraw(false);
  }

  public void activateArrayTab1D() {
    settings1D.moveTo(arrayTab1D);
  }

  public void activateArrayTab2D() {
    settings2D.moveTo(arrayTab2D);
  }

  public void activateArrayTab3D() {
    settings3D.moveTo(arrayTab3D);
  }

  public void activateArrayTab4D() {
    settings4D.moveTo(arrayTab4D);
  }

  public void getSizeX() {
  }

  public void getSizeY() {
  }

  public void getSizeZ() {
  }

  public void getSizeT() {
  }

  public PeasyCam getCam() {
    return cam;
  }

  public color getBackgroundColor() {
    return background;
  }

  public void draw() {
    arraySizeUpdate = false;
    hint(DISABLE_DEPTH_TEST); 
    cam.beginHUD();
    cp5.draw();
    cam.endHUD(); 
    hint(ENABLE_DEPTH_TEST);
  }

  public boolean arraySizeUpdate() {
    return arraySizeUpdate;
  }
}
