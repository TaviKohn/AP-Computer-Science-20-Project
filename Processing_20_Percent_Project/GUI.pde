import controlP5.*;
import peasy.*;

public class GUI {
  private ControlP5 cp5;
  private PeasyCam cam;
  private int fontHeight = 12;
  private PFont pfont = createFont("BankGothic-Medium-24.vlw", 24, true); // use true/false for smooth/no-smooth
  private ControlFont font = new ControlFont(pfont, fontHeight);
  private Group settings;
  private DropdownList arrayTypeDropdown;
  private Textlabel arrayTypeDropdownLabel;
  private Numberbox arraySizeXNumberbox;
  private Numberbox arraySizeYNumberbox;
  private Numberbox arraySizeZNumberbox;
  private Numberbox arraySizeTNumberbox;
  private Textlabel arraySizeLabel;
  private int mode = 2;
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
  private int arraySizeXNumberboxOffsetY = (int)(fontHeight * 1.5);

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

  public GUI(PApplet applet) {
    cp5 = new ControlP5(applet);
    cam = new PeasyCam(applet, 100);
    cam.setMinimumDistance(100);
    cam.setMaximumDistance(1000);
    stroke(#FFFFFF);

    cp5.getDefaultTab().remove();
    cp5.setFont(font);
    arrayTab1D = cp5.addTab("1D Array");
    arrayTab1D.setWidth(tabWidth);
    arrayTab1D.setHeight(tabHeight);
    arrayTab1D.bringToFront();
    arrayTab1D.activateEvent(true);

    arrayTab2D = cp5.addTab("2D Array");
    arrayTab2D.setWidth(tabWidth);
    arrayTab2D.setHeight(tabHeight);

    arrayTab3D = cp5.addTab("3D Array");
    arrayTab3D.setWidth(tabWidth);
    arrayTab3D.setHeight(tabHeight);

    arrayTab4D = cp5.addTab("4D Array");
    arrayTab4D.setWidth(tabWidth);
    arrayTab4D.setHeight(tabHeight);

    settings = cp5.addGroup("settingsGroup");
    settings.setPosition(settingsX, settingsY);
    settings.setWidth(settingsGroupWidth);
    settings.setBarHeight(settingsBarHeight);
    settings.setBackgroundHeight(settingsGroupHeight);
    settings.setLabel("Array Settings");
    settings.setBackgroundColor(groupBackground);
    settings.setMoveable(true);

    arraySizeLabel = cp5.addTextlabel("arraySizeLabel");
    arraySizeLabel.setPosition(arraySizeLabelX, arraySizeLabelY);
    arraySizeLabel.setText("ARRAY DIMENSIONS:");
    arraySizeLabel.setGroup(settings);

    font = new ControlFont(pfont, fontHeight);

    arraySizeXNumberbox = cp5.addNumberbox("arraySizeXNumberbox");
    arraySizeXNumberbox.setPosition(arraySizeXNumberboxX, arraySizeXNumberboxY);
    arraySizeXNumberbox.setSize(arraySizeWidth, arraySizeHeight);
    arraySizeXNumberbox.setLabel("Array Size X");
    arraySizeXNumberbox.setRange(0, 10);
    arraySizeXNumberbox.setScrollSensitivity(1.25);
    arraySizeXNumberbox.setGroup(settings);

    arrayTypeDropdownLabel = cp5.addTextlabel("arrayTypeDropdownLabel");
    arrayTypeDropdownLabel.setPosition(arrayTypeLabelX, arrayTypeLabelY);
    arrayTypeDropdownLabel.setText("ARRAY TYPE:");
    arrayTypeDropdownLabel.setGroup(settings);

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
    arrayTypeDropdown.setGroup(settings);

    cp5.setAutoDraw(false);
  }

  public int getMode() {
    return mode;
  }

  public color getBackgroundColor() {
    return background;
  }

  public void draw() {
    hint(DISABLE_DEPTH_TEST); 
    cam.beginHUD();
    cp5.draw();
    cam.endHUD(); 
    hint(ENABLE_DEPTH_TEST);
  }
}
