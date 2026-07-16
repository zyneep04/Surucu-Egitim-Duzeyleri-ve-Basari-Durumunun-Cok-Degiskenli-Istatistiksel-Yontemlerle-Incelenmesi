/* Adapted from TemelBilesenAnalizi.sas (zyneep04/Surucu-Egitim-Duzeyleri...)
   for Jenner. Original script read Drivers from an SPSS .sav import; this
   bundle builds an equivalent Drivers dataset in-line from a sample of the
   repo's own DriversLicenseData.csv so the PCA / factor-analysis logic
   below runs unmodified. */

data Drivers;
  length ApplicantID $10 Gender $6 AgeGroup $11 Race $5 Training $8 Reactions $7 Qualified $3;
  input ApplicantID $ Gender $ AgeGroup $ Race $ Training $
        Signals Yield SpeedControl NightDrive RoadSigns SteerControl
        MirrorUsage Confidence Parking TheoryTest Reactions $ Qualified $;
  datalines;
AID0495 Male Young_Adult White Advanced 50.9 59.18 72.26 78.27 26.76 46.48 46.69 65.32 74.06 81.95 Average No
AID0003 Male Middle_Age Black None 30.21 48.13 43.13 42.43 60.93 20.74 28.86 32.32 44.11 79.6 Fast Yes
AID0042 Male Teenager Other None 16.73 16.62 51.19 52.5 19.5 28.24 28.32 10.65 16.03 66 Slow No
AID0019 Female Young_Adult White Advanced 55.81 42.91 70.4 55.93 69.56 40.65 44.48 79.6 53.63 82.76 Average Yes
AID0006 Female Young_Adult Other Basic 56.09 59.31 64.18 55.77 60.92 61.85 60.88 60.91 42.64 49.4 Average Yes
AID0021 Female Middle_Age Other Advanced 57.42 72.15 79.22 59.34 40.99 77.6 61.98 54.73 75.98 69.78 Average Yes
AID0035 Female Young_Adult Other Advanced 64.4 56.27 59.61 65.55 55.81 42.55 33.56 47.63 60.49 44.64 Average Yes
AID0015 Female Middle_Age White Advanced 64.16 94.41 50.09 70.92 57.35 81.14 76.34 35.59 70.8 91.64 Average Yes
AID0029 Female Middle_Age Other Advanced 62.07 56.05 58.79 70.72 62.4 74.35 65.5 63.79 64.7 80.38 Slow Yes
AID0037 Female Young_Adult White Basic 49 59.62 59.85 57.83 52.04 52.2 53 62.27 53.02 45.65 Fast Yes
AID0020 Male Young_Adult White None 20.76 63.14 27.69 32.1 18.49 38.17 39.23 27.55 26.64 44.17 Average No
AID0441 Male Young_Adult Other Advanced 55.31 57.51 73.33 66.97 63.45 47.37 65.33 44.13 66.77 86.76 Slow Yes
AID0050 Female Teenager Other None 15.79 0 27.16 31.17 29.34 15.24 57.18 17 43.14 88.8 Slow No
AID0484 Female Young_Adult White Advanced 57.81 57.13 53.28 65.02 67.5 45.98 60.22 53.56 65.32 56.6 Slow No
AID0358 Female Young_Adult White Advanced 69.15 47.2 50.57 58.81 72.32 67.08 60.24 65.83 77.69 94.13 Slow Yes
AID0027 Female Middle_Age Black None 48.42 33.14 52.11 37.71 58.67 35.99 46.92 45.33 56.31 86.45 Slow No
AID0016 Male Middle_Age Black Basic 62.81 66.2 51.39 55.77 51.59 72.71 71.62 53.79 39.53 40.92 Slow Yes
AID0329 Female Young_Adult Other Basic 68.13 45.58 50.34 51.72 53.43 55.54 59.24 53.07 54.92 45.2 Fast No
AID0347 Male Young_Adult Black None 50.08 29.25 33.46 47.57 35.88 36.99 31.22 39.3 48.85 92.2 Slow No
AID0036 Male Teenager Other None 41.27 43.47 0 34.34 15.52 34.55 42.72 24.29 7.74 55.47 Average No
AID0049 Female Young_Adult Black None 42.35 29.22 29.03 35.73 23.23 43.54 30.14 49.69 38.62 69.36 Fast No
AID0041 Male Teenager White Advanced 44.48 51.74 61.35 60.74 54.74 47.78 41.98 39.65 55.75 73.71 Fast Yes
AID0010 Female Teenager White Advanced 56.62 50.26 35.12 49.42 26.28 57.59 41.2 37.65 50.27 50.17 Average Yes
AID0025 Female Young_Adult Black None 32.01 61.98 37.11 33.1 36.4 34.47 22.5 43.33 49.34 50.23 Fast No
AID0028 Female Young_Adult White None 31.47 43.96 37.81 25.21 21.64 32.86 42.96 29.07 36.45 41.83 Slow No
AID0492 Male Young_Adult White None 2.53 31.16 64.13 41.04 36.79 41.81 14.78 38.49 11.62 51.07 Average No
AID0349 Female Teenager Other Basic 47.88 36.9 42.26 32.41 24.17 49.47 54.76 38.71 40.38 53.14 Slow No
AID0038 Male Young_Adult Other Advanced 53.4 71.68 58.81 54.3 52.94 66.29 66.29 84.27 69.31 58.91 Fast Yes
AID0009 Male Young_Adult Other None 35.59 41.8 45.71 32.72 10.09 34.31 27.35 36.64 31.94 64.57 Slow No
AID0024 Female Middle_Age Black Basic 45.04 63.98 63.96 58.26 60.34 67.29 61.23 66.53 58.08 92.22 Average Yes
AID0045 Female Teenager Other Basic 51.58 29.16 43.92 46.62 52.17 32.95 28.96 31.43 43.57 57.77 Average Yes
AID0261 Male Young_Adult Black Basic 52.29 42.52 64.61 68.92 39.26 48.71 53.22 50.52 61.95 71.77 Average Yes
AID0026 Female Young_Adult Black None 40.66 14.54 31.03 18.13 36.58 56.55 35.67 35.04 50.14 61.15 Fast No
AID0043 Female Middle_Age White None 37.96 28.33 25.68 45.69 60.11 33.39 61.42 34.3 67.27 67.53 Average No
AID0014 Male Young_Adult Other Advanced 62.92 52.13 57.03 56.83 47.35 63.33 74.88 62.7 52.64 76.41 Average Yes
AID0500 Female Young_Adult Black Basic 47.38 67.98 44.9 47.17 44.44 52.28 55.87 54.5 53.95 77.07 Average No
AID0435 Female Middle_Age Black Basic 55.04 60.43 61.13 50.65 47.99 52.15 64.52 59.93 55.53 48.44 Average No
AID0005 Male Teenager Other Advanced 78.52 83.93 59.79 52.68 67.47 89.24 30.31 43.85 55.91 78.44 Average Yes
AID0282 Female Middle_Age White Basic 44.78 57.68 51.09 52.19 52.61 76.04 64.13 42.44 62.82 86.16 Slow No
AID0034 Female Teenager White Advanced 32.46 37.82 45.51 29.12 49.84 50.36 55.42 49.76 61.33 75.18 Fast No
;
run;

/* TBA */
proc princomp data=Drivers
    plots=(scree loading);
   var TheoryTest SpeedControl Confidence;
run;

/* FAKTÖR */
proc factor data=Drivers
     corr
     method=principal
     nfactors=2
     rotate=varimax
     reorder
     msa
     plots=(scree eigen initloadings loading);
   var TheoryTest SpeedControl Confidence;
run;
