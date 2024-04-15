# 2D Cryoprinter
Repository for the 2D Cryo-Controlled "Cryoprinter."

## Getting Started

### Prerequisites
- Arduino IDE: For uploading code to the Arduino controlling the thermal camera.
- Processing IDE: For running the visualization software.
- MLX9060X Thermal Camera
- Arduino NANO

### Installation
1. **Clone the Repository**: Clone this repository to your local machine using
   ```
   git clone https://github.com/CreativeNick/2D-Cryoprinter.git
   ```
3. **Arduino Setup**: Upload the Arduino code to your Arduino IDE. (_Change the code to match the correct port if necessary_).
4. **Processing Setup**: Similar to the Arduino Setup, upload the Processing code to your Processing IDE. (_Change the code to match the correct port if necessary_).

## Usage

Once both the Arduino and Processing setups are complete, first run the Arduino sketch and **close the Serial Monitor** (_Both serial monitors for Arduino and Processing cannot be active at the same time_). Then run the Processing sketch to start visualizing the thermal data. This visualization aids in monitoring and adjusting the cryoprinting process in real-time.
