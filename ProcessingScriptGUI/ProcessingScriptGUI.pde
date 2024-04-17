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
      rect(flippedIndex * rectWidth, i * rectHeight, rectWidth, rectHeight);
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

    // From dark purple to blue
    if (i < 128) {
      hue = map(i, 0, 128, 255, 170); // Purple to blue hues in HSB

    // From blue to red
    } else {
      hue = map(i, 128, 256, 170, 0); // Blue to red hues in HSB
    }

    // HSB: Hue (color), Saturation, Brightness
    camColors[i] = color(hue, 255, map(i, 0, 255, 50, 255)); // From less bright to full brightness
  }
}
