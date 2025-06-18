# 🧮 Approximate Wallace Tree Multiplier using Verilog HDL

This project implements an **Approximate 8x8 Wallace Tree Multiplier** in **Verilog HDL**, optimized for **power, area, and performance** — making it suitable for **modern low-power VLSI applications** such as **image processing, signal processing, and machine learning inference engines**.

---

## 🚀 Motivation

Multipliers are **critical components** in DSP and ML accelerators, but they often dominate power and area. Approximate computing helps us **reduce hardware complexity** by relaxing accuracy in non-critical applications (like image filters or AI inference).

We chose a **Wallace Tree architecture** due to:
- Its **parallel carry-save addition** structure, which reduces the delay.
- Naturally better suited for **pipelining**.
- High-speed and hardware-efficient operation.

To further optimize, we introduced **approximation techniques** in the final reduction stages.

---

## ⚙️ Challenges in Existing Systems

| Problem in Traditional Multipliers         | Our Solution                                      |
|--------------------------------------------|---------------------------------------------------|
| High power consumption                     | Approximation and pruning logic                   |
| Area overhead due to full precision        | Reduced logic paths and simplified adders         |
| Delay due to ripple/array logic            | Wallace Tree structure for faster computation     |
| Accuracy trade-off hard to control         | Tunable approximation module                      |
| Difficult synthesis on low-resource FPGAs  | Area-limited design validated on small LUT count  |

---

## 🛠️ Features

- Wallace Tree-based Partial Product Reduction
- Custom Approximate Final Stage Adder
- Low LUT count: **64 / 41000**
- Low timing slack: **0 ns** (No Setup/Hold violation)
- Core logic power: **~0.47W**
- Simulated in Vivado XSim with multiple test cases
- Modular design — ready for extension to 16x16

---

## 🔧 Design Methodology

1. **Partial Product Generation** using AND gates
2. **Reduction Stage** using Carry Save Adders (CSA) in a tree-like Wallace structure
3. **Approximate Adder** replaces exact adder in final stage (e.g., truncation, carry dropping)
4. **Output Registering** for pipelining (optional for future design)

---

## 🧪 Simulation Results

Simulation verified on 8-bit inputs with known correct results:
| Inputs         | Output |
|----------------|--------|
| A = 12, B = 3  | 36     |
| A = 5,  B = 7   | 35     |
| A = 15, B = 15 | 225    |
| A = 100,B = 50| 5000   |


✅ Output was validated against expected results in all corner cases (low input, high input, overflow test).

---

## 📊 Reports & Analysis

### 🔹 Area Utilization

| Resource     | Used | Available |
|--------------|------|-----------|
| Slice LUTs   | 64   | 41000     |
| Bonded IOBs  | 32   | 300       |

> ✔️ Compact and efficient for small-scale FPGA/VLSI design.

### 🔹 Power Consumption

| Type     | Power (W) | Percentage |
|----------|-----------|------------|
| Dynamic  | 13.114 W  | 99%        |
| Signals  | 0.215 W   | 2%         |
| Logic    | 0.471 W   | 4%         |
| I/O      | 12.428 W  | 94%        |
| Static   | 0.123 W   | 1%         |

> ⚠️ High I/O power due to switching activity in simulation. Logic power is very low — ideal for integration.

### 🔹 Timing Summary

| Metric | Value |
|--------|-------|
| Worst Negative Slack (WNS) | inf (no violation) |
| Total Negative Slack (TNS) | 0.000 ns |
| Hold Slack                 | 0.000 ns |
| Pulse Width Violation      | None     |

---

## 📁 Project Structure

```
ApproxWallaceMultiplier/
├── README.md                          # Project overview and documentation
├── src/                               # Source files
│   └── wallace_tree_approx.v          # Verilog RTL for Wallace Tree multiplier
├── tb/                                # Testbenches
│   └── testbench.v                    # Verilog testbench
├── sim/                               # Simulation results
│   ├── waveform.png                   # Screenshot of waveform from simulation
│   └── test_output.txt                # Text output from simulation run
├── reports/                           # Synthesis and implementation reports
│   ├── area_report.png                # Area utilization (LUTs, IOBs)
│   ├── power_report.png               # Power analysis
│   └── timing_report.png              # Timing summary (WNS, TNS, etc.)
├── architecture_diagram.png           # Architecture/block diagram
└── vivado_project/                    # Vivado project files
    └── ApproxWallaceMultiplier.xpr    # Vivado project file
```

---

## 🧰 Tools Used

- **Vivado 2024.2** (Design + Simulation + Synthesis)
- **Verilog HDL**
- **XSim Simulator**
- **Windows 10 / Linux Support**

---

## 📌 Future Enhancements

- Support for **16x16 or 32x32 bit multiplication**
- Integration with **Neural Network accelerators**
- Optional **pipeline stages** for high-frequency design
- Dynamic approximation level switching (accuracy vs power)

---

## 🔓 License

This project is licensed, so use it for _**educational purpose only**_.

---

## 🙌 Acknowledgements

Thanks to open-source communities and Xilinx tools support.

---

