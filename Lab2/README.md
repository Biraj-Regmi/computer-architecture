# Lab 2: Hardware Description of Logic Gates via VHDL

## 1. Experimental Objective
* To model basic logic gates (AND, OR, NOT, NAND, NOR, XOR, and XNOR) using concurrent VHDL behavioral descriptions.
* To perform a timing simulation of the synthesized architectures and validate their truth tables using GTKWave.

---

## 2. Theoretical Overview
Digital logic gates serve as the fundamental primitive units for complex combinational and sequential digital circuits. Every gate executes a distinct Boolean operation on input signals to yield a deterministic binary result. 

The primary logical variants, their native VHDL keywords, and corresponding Boolean functions are mapped below:

| Logic Gate | VHDL Syntax Operator | Boolean Expression |
| :--- | :--- | :--- |
| **AND** | `and` | Y = A · B |
| **OR** | `or` | Y = A + B |
| **NOT** | `not` | Y = bar(A) |
| **NAND** | `nand` | Y = bar(A · B) |
| **NOR** | `nor` | Y = bar(A + B) |
| **XOR** | `xor` | Y = A ⊕ B |
| **XNOR** | `xnor` | Y = bar(A ⊕ B) |

---

## 3. Simulation Trace & Waveform Graph
The functional performance of each modeled gate was evaluated over a 40 ns test sequence. The resulting timing transitions monitored in GTKWave are illustrated below:

![Simulation Waveform](<img width="1249" height="676" alt="Lab2Output" src="https://github.com/user-attachments/assets/7218ab5b-cf3e-4913-92b2-657acf537c00" />

 )

---

## 4. Analytical Discussion and Conclusion
By analyzing the waveform tracking generated within GTKWave, we can verify that the VHDL code handles signal manipulation exactly as predicted by standard Boolean truth tables. The simulation runs through four distinct input states over time:

* **0 ns to 10 ns:** Both logic inputs are low (`a = 0`, `b = 0`). During this frame, inverse outputs like NAND, NOR, and XNOR correctly resolve to `1`, while active-high responses stay at `0`.
* **10 ns to 20 ns:** The input vector shifts to `a = 1` and `b = 0`. This causes state changes in gates like the XOR (which tracks inequality) and universal inverted gates.
* **20 ns to 30 ns:** The states invert to `a = 0` and `b = 1`. Because the logic structures are symmetric, the outputs perfectly match the functional state of the previous window.
* **30 ns onwards:** Both driving vectors settle at a high logic level (`a = 1`, `b = 1`). Consequently, standard coincidence gates like AND and OR drive high (`1`), while inverted outputs switch to low (`0`).

**Conclusion:** The timing simulation traces match expected mathematical predictions perfectly. This successfully demonstrates that the written VHDL code correctly realizes the behavioral and structural characteristics of hardware logic gates.
