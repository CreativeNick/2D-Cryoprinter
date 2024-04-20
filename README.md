# 2D Cryoprinter
Repository for the Temperature-Controlled 2D "Cryoprinter."

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

## Examples
<table>
  <tr>
    <td><img src="[URL_TO_IMAGE_1](https://github.com/CreativeNick/2D-Cryoprinter/assets/43157506/c9ec7f9d-6cc2-4624-ab05-2ba3231c9935)" width="100%" /></td>
    <td><img src="[URL_TO_IMAGE_2](https://github.com/CreativeNick/2D-Cryoprinter/assets/43157506/7f3fd846-bb62-4be9-b793-bcc145a5bfc1)" width="100%" /></td>
  </tr>
  <tr>
    <td><img src="[URL_TO_IMAGE_3](https://github.com/CreativeNick/2D-Cryoprinter/assets/43157506/ae5008b1-7190-4132-8d64-197e4625c613)" width="100%" /></td>
    <td><img src="[URL_TO_IMAGE_4](https://github.com/CreativeNick/2D-Cryoprinter/assets/43157506/93999908-74a3-4834-8cd0-caece8b744e3)" width="100%" /></td>
  </tr>
</table>
