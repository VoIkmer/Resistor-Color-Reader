# 🎨 Resistor Color Code Reader

This MATLAB project allows you to **calculate the value of a resistor** based on its color bands.  
It also **visualizes the resistor's color bands** and displays the **calculated resistor value and tolerance**.

---

## 🧠 Overview

The script:
1. Accepts **user input** for the resistor's color bands (4 or 5 bands).  
2. Validates the entered colors against standard resistor color codes.  
3. Calculates the **resistor value** based on the bands and the multiplier.  
4. Determines the **tolerance** of the resistor.  
5. Displays a **visual representation of the color bands** with the resistor value.  

---

## ⚙️ Requirements

- **MATLAB R2020a** or later
- Basic understanding of resistor color codes
- User must input **valid color names** from the following options:

| Color   | Value |
|---------|-------|
| black   | 0     |
| brown   | 1     |
| red     | 2     |
| orange  | 3     |
| yellow  | 4     |
| green   | 5     |
| blue    | 6     |
| violet  | 7     |
| gray    | 8     |
| white   | 9     |
| gold    | -1 (multiplier/tolerance) |
| silver  | -2 (multiplier/tolerance) |

---

## 🚀 How to Use

1. Open MATLAB and run the script:

   ```matlab
   resistor_reader
   ```

2. Input the number of bands (**4 or 5**).  
3. Enter the colors for each band when prompted.  
4. The script will:
   - Validate the colors.  
   - Calculate the resistor value and tolerance.  
   - Display a figure showing the **color bands and their values**.  
   - Show the **resistor value and tolerance** above the color bands.

---

## 🧩 Output Example

- **Resistor Value:** 4700 Ω ±5%  
- **Visualization:** Color squares for each band with their respective values below.  

# 📊 Visualization — Color Bands & Values

![Resistor Color Band](images/resistor%20band.jpg)

    Output Example: Graphical representation of the resistor. The script plots each color band
    as a square with its numeric value below, while the final calculated resistance and 
    tolerance are displayed at the top.

---


## 🧠 Key Variables

| Variable | Description |
|----------|-------------|
| `band_colors` | Cell array of entered color names |
| `band_values` | Cell array of corresponding numeric values or multiplier |
| `resistor_value` | Calculated resistor value in ohms |
| `tolerance` | Resistor tolerance from the color code |
| `colors` | Struct mapping color names to numeric values |
| `colors_rgb` | Struct mapping color names to RGB colors for plotting |

---

## 🧑‍💻 Author

**Carlos Eduardo Guimarães Barbosa**  
Electrical Engineering Student | MATLAB Enthusiast  

📧 Contact: cguimaraesbarbosa03@gmail.com  
🌐 GitHub: [VoIkmer](https://github.com/VoIkmer)  

---

## 📚 License

This project is licensed under the **MIT License** — feel free to use, modify, and share it.
