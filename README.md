# Modulated_sim

## Summation of codes from final year project

This project aims at dealing with SRAS raw data.  

Modulated components and procedures from prviously tested codes.  

1. Modelling signal of SRAS.
2. Fourier Transform.
3. Frequency seperation.
4. Image processing.

## To access result from mass prc

Use the following commands in terminal.  

```matlab
size(stArr_simresult) % to verify its dimensions
% then choose desired coordinates for following figures
g1 = stArr_simresult(1,1,11,11,4,1).initg1
g2 = stArr_simresult(1,1,11,11,4,1).initg2
res = stArr_simresult(1,1,11,11,4,1).val_corr
```

## ACVMS Record

-`IR_ACV1.mat` First test.  
-`IR_ACV2.mat` Small acv with 0 noise.  
-`IR_ACV3.mat` Small acv with 5% noise.  
-`IR_ACV4.mat` Small acv with 10% noise.  
-`IR_ACV5.mat` Mismatch noticed, test with smaller output array.  
-`IR_ACV6.mat` Mismatch noticed, test with smaller output array.  
-`IR_ACV7.mat` Correction of index and value of deg. At deg = 179, problem occurs.  
-`IR_ACV8.mat` Correction of index and value of deg.  
-`IR_ACV9.mat` Increase the tolerance for finding the maximum corr result.  
-`IR_ACV10.mat` With 0 noise and 5 angles, testing the correction. Problem not solved, when introducing non-0 deg, obvious deviation.  

IR_ACV25.mat  

```matlab
noise_level = [0];
n_fringe = [12];
n_step = [18];
g1_prop = [1];
initg1.x_miller = [0];
initg1.y_miller = [0];
initg1.deg = [0 : 179];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

---

### ACV25

is a test for IRMETHOD  

---

ACV26_IR.mat  

```matlab
noise_level = [0, 0.05, 0.1, 0.15, 0.2];
n_fringe = [12];
n_step = [18];
g1_prop = [1];
initg1.x_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.y_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.deg = [0 : 179];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV27_IR.mat  

```matlab
noise_level = [0.25, 0.3];
n_fringe = [12];
n_step = [18];
g1_prop = [1];
initg1.x_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.y_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.deg = [0 : 179];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV28_IR.mat  

```matlab
noise_level = [0.35, 0.4, 0.45, 0.5];
n_fringe = [12];
n_step = [18];
g1_prop = [1];
initg1.x_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.y_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.deg = [0 : 179];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

---

### ACV26-28

loop for g1  
covers miller indices of 0, 0.25, 0.5, 0.75 and 1  
with all deg  
and all noise levels  
with a fixed setup

---

ACV29_FS.mat  

```matlab
noise_level = [0];
n_fringe = [12];
n_step = [18];
g1_prop = [0.6];
initg1.x_miller = [0, 1];
initg1.y_miller = [0, 1];
initg1.deg = [0];
initg2.x_miller = [0, 1];
initg2.y_miller = [0, 1];
initg2.deg = [0];
```

ACV30_FS.mat  

```matlab
noise_level = [0];
n_fringe = [12];
n_step = [18];
g1_prop = [0.6];
initg1.x_miller = [0, 1];
initg1.y_miller = [0, 1];
initg1.deg = [60, 90];
initg2.x_miller = [0, 1];
initg2.y_miller = [0, 1];
initg2.deg = [60, 90];
```

ACV31_FS.mat  

```matlab
noise_level = [0];
n_fringe = [12];
n_step = [18];
g1_prop = [0.6];
initg1.x_miller = [0, 0.5, 1];
initg1.y_miller = [0, 0.5, 1];
initg1.deg = [0, 30, 60, 90, 120, 150];
initg2.x_miller = [0, 0.5, 1];
initg2.y_miller = [0, 0.5, 1];
initg2.deg = [0, 30, 60, 90, 120, 150];
```

---

### ACV29-31

are tests for FSMETHOD  
where 31 is a set of proper results for older thresholding method  
which has several problems  

- cannot distinghuish 1 grain
- highly misorientated for lower proportional grain  

---

ACV32_FS.mat

```matlab
noise_level = [0, 0.1, 0.2];
n_fringe = [12];
n_step = [18];
g1_prop = [0.6];
initg1.x_miller = [0, 0.5, 1];
initg1.y_miller = [0, 0.5, 1];
initg1.deg = [0];
initg2.x_miller = [0, 0.5, 1];
initg2.y_miller = [0, 0.5, 1];
initg2.deg = [0];
```

ACV33_FS.mat

```matlab
noise_level = [0, 0.1, 0.2];
n_fringe = [12];
n_step = [18];
g1_prop = [0.6];
initg1.x_miller = [0, 0.5, 1];
initg1.y_miller = [0, 0.5, 1];
initg1.deg = [0];
initg2.x_miller = [0, 0.5, 1];
initg2.y_miller = [0, 0.5, 1];
initg2.deg = [0];
```

ACV34_FS.mat

```matlab
noise_level = [0, 0.1, 0.2];
n_fringe = [12];
n_step = [18];
g1_prop = [0.6];
initg1.x_miller = [0, 0.5, 1];
initg1.y_miller = [0, 0.5, 1];
initg1.deg = [0];
initg2.x_miller = [0, 0.5, 1];
initg2.y_miller = [0, 0.5, 1];
initg2.deg = [0];
```

---

### ACV32-34

are testing new thresholding methods with FSMETHOD  
for ACV32_FS, mod4postFSPEC_t1
for ACV33_FS, mod4postFSPEC_t2  
for ACV34_FS, mod4postFSPEC_t3  

---

ACV35_IR.mat

```matlab
noise_level = [0];
n_fringe = [12];
n_step = [18];
g1_prop = [1];
initg1.x_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.y_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.deg = [0, 90];
initg2.x_miller = [0, 0.25, 0.5, 0.75, 1];
initg2.y_miller = [0, 0.25, 0.5, 0.75, 1];
initg2.deg = [0, 90];
```

ACV36_IR.mat

```matlab
noise_level = [0, 0.05, 0.1, 0.15];
n_fringe = [12];
n_step = [36];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV37_IR.mat

```matlab
noise_level = [0.2, 0.25, 0.3];
n_fringe = [12];
n_step = [36];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV38_IR.mat

```matlab
noise_level = [0.35, 0.4, 0.45, 0.5];
n_fringe = [12];
n_step = [36];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

---

### ACV36-38

data with new noise generation and snr  
new grain sets  
IR at n_step = 36  

---

ACV39_IR.mat

```matlab
noise_level = [0, 0.05, 0.1, 0.15];
n_fringe = [12];
n_step = [18];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV40_IR.mat

```matlab
noise_level = [0.2, 0.25, 0.3];
n_fringe = [18];
n_step = [36];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV41_IR.mat

```matlab
noise_level = [0.35, 0.4, 0.45, 0.5];
n_fringe = [12];
n_step = [18];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

---

### ACV39-41

data with new noise generation and snr  
new grain sets  
IR at n_step = 18  

---

ACV42_IR.mat  

```matlab
noise_level = [0.01 : 0.01 : 0.15];
n_fringe = [12];
n_step = [18];
g1_prop = [0 : 0.05 : 1];
initg1.x_miller = [0, 1];
initg1.y_miller = [0, 1];
initg1.deg = [0];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

---

### ACV42

This is analysing the relation of noise level and SNR  
with g1_prop involved  

---

ACV43_IR.mat

```matlab
noise_level = [0, 0.05, 0.1, 0.15];
n_fringe = [12];
n_step = [90];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV44_IR.mat

```matlab
noise_level = [0.2, 0.25, 0.3];
n_fringe = [12];
n_step = [90];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV45_IR.mat

```matlab
noise_level = [0.35, 0.4, 0.45, 0.5];
n_fringe = [12];
n_step = [90];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

---

### ACV43-45

data with new noise generation and snr  
new grain sets  
IR at n_step = 90  

---

ACV46_IR.mat

```matlab
noise_level = [0, 0.05, 0.1, 0.15];
n_fringe = [12];
n_step = [180];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV47_IR.mat

```matlab
noise_level = [0.2, 0.25, 0.3];
n_fringe = [12];
n_step = [180];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

ACV48_IR.mat

```matlab
noise_level = [0.35, 0.4, 0.45, 0.5];
n_fringe = [12];
n_step = [180];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

---

### ACV46-48

data with new noise generation and snr  
new grain sets  
IR at n_step = 180  

---

ACV49.mat

```matlab
noise_level = [0.1];
n_fringe = [4, 8, 16];
n_step = [36];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

---

### ACV49

evaluating fringe number  

---

ACV50.mat

```matlab
noise_level = [0.1];
n_fringe = [12];
n_step = [9];
g1_prop = [1];
initg1.x_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.y_miller = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
initg1.deg = [0 : 15 : 165];
initg2.x_miller = [0];
initg2.y_miller = [0];
initg2.deg = [0];
```

---

### ACV50

data with new noise generation and snr  
new grain sets  
IR at n_step = 9  

---

ACV51.mat

```matlab
noise_level = [0, 0.1];
n_fringe = [12];
n_step = [36];
g1_prop = [0.1, 0.3, 0.5];
initg1.x_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.y_miller = [0, 0.25, 0.5, 0.75, 1];
initg1.deg = [randi(), randi(), randi()];
initg2.x_miller = [0, 0.25, 0.5, 0.75, 1];
initg2.y_miller = [0, 0.25, 0.5, 0.75, 1];
initg2.deg = [randi(), randi(), randi()];
```

ACV52.mat
