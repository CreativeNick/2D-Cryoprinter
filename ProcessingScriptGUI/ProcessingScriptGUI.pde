import processing.serial.*;

Serial myPort;
int cols = 32;
int rows = 24;
int[][] colorIndices = new int[rows][cols];
int[] camColors;
float rectWidth, rectHeight;

void setup() {
  size(640, 480);
  println(Serial.list()); // Check all available serial ports
  myPort = new Serial(this, Serial.list()[1], 115200); // Note to change if port is different
  myPort.bufferUntil('\n');
  rectWidth = width / float(cols);
  rectHeight = height / float(rows);
  colorMode(HSB, 255);
  generateColorPalette();
}

void draw() {
  background(0);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      // Flip horizontally by starting from the right
      int flippedIndex = cols - 1 - j;
      
      fill(camColors[colorIndices[i][flippedIndex]]);
      rect(j * rectWidth, i * rectHeight, rectWidth, rectHeight); // Use 'j' instead of 'flippedIndex' for x position

    }
  }
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    int[] colorsRow = int(split(inString, ' '));
    if (colorsRow.length == cols) {
      for (int i = 0; i < rows - 1; i++) {
        colorIndices[i] = colorIndices[i + 1];
      }
      colorIndices[rows - 1] = colorsRow;
    }
  }
}

void generateColorPalette() {
  camColors = new int[256];
  colorMode(HSB, 255);
  for (int i = 0; i < 256; i++) {
    float hue;

    // Lower third: Emphasizing colder areas
    if (i < 85) {
      hue = map(i, 0, 85, 180, 120); // From light blue to green
      
    // Middle third: Transition zone
    } else if (i < 170) {
      hue = map(i, 85, 170, 120, 60); // From green to yellow
      
    // Upper third: Warmer areas
    } else {
      hue = map(i, 170, 255, 60, 0); // From yellow to red
    }

    camColors[i] = color(hue, 255, map(i, 0, 255, 50, 255));
  }
}
