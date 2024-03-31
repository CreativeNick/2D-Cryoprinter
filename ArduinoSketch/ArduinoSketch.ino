#include <Adafruit_MLX90640.h>

Adafruit_MLX90640 mlx;
float frame[32 * 24]; // Buffer for full frame of temperatures
#define MINTEMP 20 // Low range of the sensor
#define MAXTEMP 35 // High range of the sensor

void setup() {
  Serial.begin(115200);
  while (!Serial); // wait for Serial to be ready

  if (!mlx.begin(MLX90640_I2CADDR_DEFAULT, &Wire)) {
    Serial.println("MLX90640 not found!");
    while (1) delay(10);
  }

  mlx.setMode(MLX90640_CHESS);
  mlx.setResolution(MLX90640_ADC_18BIT);
  mlx.setRefreshRate(MLX90640_4_HZ);
}

void loop() {
  if (mlx.getFrame(frame) != 0) {
    Serial.println("Failed to read frame!");
    return;
  }

  for (uint8_t h = 0; h < 24; h++) {
    for (uint8_t w = 0; w < 32; w++) {
      float t = frame[h * 32 + w];
      t = min(t, MAXTEMP);
      t = max(t, MINTEMP);
      uint8_t colorIndex = map(t, MINTEMP, MAXTEMP, 0, 255);
      colorIndex = constrain(colorIndex, 0, 255);
      Serial.print(colorIndex);
      Serial.print(" ");
    }
    Serial.println(); // End of row
  }
}
