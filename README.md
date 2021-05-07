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

---

IR_ACV25.mat  

---

noise_level = 0  
n_fringe = 12  
n_step = 18  
g1_prop = 1  
initg1.x_miller = 0  
initg1.y_miller = 0  
initg1.deg = [1,180]  
initg2.x_miller = 0  
initg2.y_miller = 0  
initg2.deg = 0  

---

IR_ACV26.mat  

---

noise_level = 0  
n_fringe = 12  
n_step = 18  
g1_prop = 1  
initg1.x_miller = 0  
initg1.y_miller = 0  
initg1.deg = [1,180]  
initg2.x_miller = 0  
initg2.y_miller = 0  
initg2.deg = 0  
