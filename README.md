# Diving into the Depths: Unraveling the Hidden Dynamics of Pressure and Volume in Scuba Diving
A comprehensive report along with MATLAB scripts that model the physical dynamics of scuba diving. This contains the applications of Boyle's Law on lung capacity, the temperature of seawater density across different global locations, and also the diver's suit compression.

## Core Objectives & Models
This repository contains three distinct mathematical models, each simulating a specific underwater physical phenomenon:

### 1. Lung Pressure & Volume Dynamics (LungPressureVolume.m)
* Simulates the pressure and volume of air in a diver's lungs during descent and ascent.
* Assumes a constant temperature and adheres to U.S. Navy safe descent/ascent rate guidelines (≤ 23 m/min descent, ≤ 12 m/min ascent).
* Utilizes Boyle's Law ($P_1V_1 = P_2V_2$) to demonstrate the inverse relationship between hydrostatic pressure and lung volume.

### 2. Environmental Impacts on Seawater Density (SeawaterLocationModel.m)
* Expands the baseline model to account for multi-variable environmental conditions across three global locations with varying seawater temperatures: Juneau, Alaska (10 °C), Paita, Peru (20 °C), and Savannah Beach, Georgia (30 °C).
* Applies the seawater density equation $$\rho(T)=\rho_{0}(1-\beta(T-T_{0}))$$ to demonstrate how temperature-induced density changes affect the rate of lung volume compression at depth. 

### 3. Diver Suit Compression (SuitPressureVolume.m)
* Models the compression of air inside a diver's suit (initial volume: 8L) as depth increases.
* Highlights the practical implications of volume reduction on a diver's buoyancy and mobility, emphasizing the need for active buoyancy compensation.

## Technologies & Tools
* **MATLAB / GNU Octave:** Used for array operations, mathematical logic, and generating data visualizations.
* **LaTeX:** Used for typesetting the formal academic report and rendering mathematical equations.

## How to Run the Code
* The scripts in this repository can be executed in either MATLAB or GNU Octave.
* Clone the repository to your local machine.
* Open the **src/** directory in your MATLAB/Octave environment.
* Run the scripts individually. Each script will automatically clear the workspace to prevent variable overlap and generate the respective depth-volume-pressure plots.

**Author:** Anthony Artino
