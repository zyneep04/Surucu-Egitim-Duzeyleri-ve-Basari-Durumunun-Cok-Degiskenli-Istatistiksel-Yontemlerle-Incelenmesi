/* Adapted from KümelemeAnalizi.sas (zyneep04/Surucu-Egitim-Duzeyleri...)
   for Jenner. Original script read DriversKumelemeOrneklem from an SPSS
   .sav sample; this bundle builds an equivalent dataset in-line from a
   sample of the repo's own DriversLicenseData.csv so the hierarchical +
   K-means clustering logic below runs unmodified. */

data DriversKumelemeOrneklem;
  length ApplicantID $10;
  input ApplicantID $ SpeedControl Confidence TheoryTest;
  datalines;
AID0495 72.26 46.69 74.06
AID0003 43.13 28.86 44.11
AID0042 51.19 28.32 16.03
AID0019 70.4 44.48 53.63
AID0006 64.18 60.88 42.64
AID0021 79.22 61.98 75.98
AID0035 59.61 33.56 60.49
AID0015 50.09 76.34 70.8
AID0029 58.79 65.5 64.7
AID0037 59.85 53 53.02
AID0020 27.69 39.23 26.64
AID0441 73.33 65.33 66.77
AID0050 27.16 57.18 43.14
AID0484 53.28 60.22 65.32
AID0358 50.57 60.24 77.69
AID0027 52.11 46.92 56.31
AID0016 51.39 71.62 39.53
AID0329 50.34 59.24 54.92
AID0347 33.46 31.22 48.85
AID0036 0 42.72 7.74
AID0049 29.03 30.14 38.62
AID0041 61.35 41.98 55.75
AID0010 35.12 41.2 50.27
AID0025 37.11 22.5 49.34
AID0028 37.81 42.96 36.45
AID0492 64.13 14.78 11.62
AID0349 42.26 54.76 40.38
AID0038 58.81 66.29 69.31
AID0009 45.71 27.35 31.94
AID0024 63.96 61.23 58.08
AID0045 43.92 28.96 43.57
AID0261 64.61 53.22 61.95
AID0026 31.03 35.67 50.14
AID0043 25.68 61.42 67.27
AID0014 57.03 74.88 52.64
AID0500 44.9 55.87 53.95
AID0435 61.13 64.52 55.53
AID0005 59.79 30.31 55.91
AID0282 51.09 64.13 62.82
AID0034 45.51 55.42 61.33
;
run;

/*Hiyerarşik Kümeleme Analizi*/
proc cluster data=DriversKumelemeOrneklem method=ward outtree=ward ;



VAR SpeedControl Confidence TheoryTest ;
run;

/* Dendrogramı çizdirme */
proc tree data=DriversKumelemeOrneklem;
run;




								/*K-MEANS KÜMELEME ANALİZİ*/
proc fastclus data= DriversKumelemeOrneklem maxiter=10 maxclusters=3 list distance out=clust;
	var SpeedControl Confidence TheoryTest;
	id ApplicantID;
run;

/*Değişkenlerin kümelemede anlamlı olup olmadığını görmek için glm komutu kullanılıyor */
proc glm data=clust;
class cluster;
model SpeedControl=cluster;
run;

proc glm data=clust;
class cluster;
model Confidence=cluster;
run;

proc glm data=clust;
class cluster;
model TheoryTest=cluster;
run;
