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
