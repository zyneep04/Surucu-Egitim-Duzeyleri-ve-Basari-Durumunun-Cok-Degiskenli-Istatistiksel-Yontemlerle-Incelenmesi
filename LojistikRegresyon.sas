/* Binary Lojistik Regresyon*/
proc logistic data=Drivers ;
class Qualified(ref="No") Training(ref="None");
model Qualified = Confidence SteerControl TheoryTest Training /expb lackfit rsquare;
output out=outdata_bin predprobs=(individual);
run;

proc freq data=outdata_bin;
tables _FROM_*_INTO_;
run;


/* Stepwise Lojistik Regresyon*/
proc logistic data=Drivers ;
class Qualified(ref="No") Training(ref="None");
model Qualified = Confidence SteerControl TheoryTest Training /expb lackfit rsquare selection=backward;
output out=outdata_step predprobs=(individual);
run;

proc freq data=outdata_step;
tables _FROM_*_INTO_;
run;





/* Multinomial Lojistik Regresyon*/
proc logistic data=Drivers ;
class Training(ref="None") ;
model Training = Confidence SpeedControl TheoryTest /link = glogit expb lackfit rsquare;
output out=outdata_multi predprobs=(individual);
run;

proc freq data=outdata_multi;
tables _FROM_*_INTO_;
run;


	