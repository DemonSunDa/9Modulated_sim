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

IR_ACV26.mat  

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

IR_ACV27.mat  

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

IR_ACV28.mat  

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

ACV26-28  
covers miller indices of 0, 0.25, 0.5, 0.75 and 1  
with all deg  
and all noise levels  
with a fixed setup

---

IR_ACV29.mat  

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

IR_ACV30.mat  

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

IR_ACV31.mat  

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

ACV29-31  
are tests for FSMETHOD  
where 31 is a set of proper results  

---
