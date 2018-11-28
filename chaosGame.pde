import controlP5.*;

int NUMBER_OF_POINTS;
float LERP_AMOUNT;
int FPS;

ArrayList<Point> points;
float currentX; 
float currentY;

ControlP5 cp5;

void setup() {
  NUMBER_OF_POINTS = 3;
  LERP_AMOUNT = 0.5;
  FPS = 10;
  size(800, 800);
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("NUMBER OF POINTS").setPosition(10, 10).setText(NUMBER_OF_POINTS+"");
  cp5.addTextfield("LEAP AMOUNT").setPosition(10, 50).setText(LERP_AMOUNT+"");
  cp5.addTextfield("FPS").setPosition(10,90).setText(FPS+"");
  cp5.addBang("Reset").setPosition(10, 125);
  points = new ArrayList<Point>();
  background(51);
  Reset();
}

void draw() {

  for (int i=0; i<FPS; i++) {
    int random = (int) random(NUMBER_OF_POINTS);
    Point point = points.get(random);

    currentX =  lerp(currentX, point.getX(), LERP_AMOUNT);
    currentY =  lerp(currentY, point.getY(), LERP_AMOUNT);

    point(currentX, currentY);
  }
}

void Reset() {
  background(51);
  try {
    NUMBER_OF_POINTS = Integer.parseInt(cp5.get(Textfield.class, "NUMBER OF POINTS").getText());
    LERP_AMOUNT = Float.parseFloat(cp5.get(Textfield.class,"LEAP AMOUNT").getText());
    FPS = Integer.parseInt(cp5.get(Textfield.class,"FPS").getText());
  }
  catch(Exception e) {
  }
  
  points.clear();
  
  for (int i=0; i<NUMBER_OF_POINTS; i++) {
    points.add(new Point(random(width), random(height)));
  }

  stroke(255, 0, 255);
  strokeWeight(7);

  for (Point x : points) {
    point(x.getX(), x.getY());
  }
  strokeWeight(3);
  stroke(0, 255, 0);
  currentX = (int) random(width);
  currentY= (int) random(height);

  point(currentX, currentY);
}
