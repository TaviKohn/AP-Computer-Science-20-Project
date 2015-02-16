import controlP5.*;
import peasy.*;

public class GUI {
  private ControlP5 cp5;
  private PeasyCam cam;
  private Group settings;
  private DropdownList arrayTypeDropdown;
  private Textlabel arrayTypeDropdownLabel;
  private int mode = 0;
  private Tab arrayTab1D;
  private Tab arrayTab2D;
  private Tab arrayTab3D;
  private Tab arrayTab4D;
  //private color elementColor = #123ABC;
  private color background = #AAAAAA;
  private int tabWidth = 50;

  public GUI(ControlP5 cp5, PeasyCam cam) {
    this.cp5 = cp5;
    this.cam = cam;

    cp5.getDefaultTab().remove();

    arrayTab1D = cp5.addTab("1D Array");
    arrayTab1D.setWidth(tabWidth);
    arrayTab1D.bringToFront();
    arrayTab1D.activateEvent(true);

    arrayTab2D = cp5.addTab("2D Array");
    arrayTab2D.setWidth(tabWidth);

    arrayTab3D = cp5.addTab("3D Array");
    arrayTab3D.setWidth(tabWidth);

    arrayTab4D = cp5.addTab("4D Array?");
    arrayTab4D.setWidth(tabWidth);

    settings = cp5.addGroup("Array Settings");
    settings.setPosition(0, 50);
    settings.setWidth(150);
    settings.setBackgroundHeight(300);
    settings.setBackgroundColor(100);
    
    arrayTypeDropdownLabel = cp5.addTextlabel("arrayTypeDropdownLabel");
    arrayTypeDropdownLabel.setPosition(5,5);
    arrayTypeDropdownLabel.setText("Array Type:");
    arrayTypeDropdownLabel.setGroup(settings);

    arrayTypeDropdown = cp5.addDropdownList("Array Type");
    arrayTypeDropdown.setPosition(5, 30);
    arrayTypeDropdown.addItems(new String[] {
      "boolean", "int", "Double", "String"
    }
    );
    arrayTypeDropdown.setIndex(0);
    arrayTypeDropdown.setGroup(settings);

    cp5.setAutoDraw(false);
  }

  public int getMode() {
    return mode;
  }
  
  public color getBackgroundColor(){
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
