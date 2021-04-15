# Modulated_sim

## Summation of codes from final year project

This project aims at dealing with SRAS raw data.

Modulated components and procedures from prviously tested codes.

---

1. Modelling signal of SRAS.
2. Fourier Transform.
3. Frequency seperation.
4. Image processing.

---

## To access result from mass prc.

Use the following commands in terminal.

```
size(stArr_simresult) % to verify its dimensions
% choose desired coordinates for following 1s
g1 = stArr_simresult(1,1,1,1,1,1).initg1;
g2 = stArr_simresult(1,1,1,1,1,1).initg2;
res = stArr_simresult(1,1,1,1,1,1).corr_val
```
