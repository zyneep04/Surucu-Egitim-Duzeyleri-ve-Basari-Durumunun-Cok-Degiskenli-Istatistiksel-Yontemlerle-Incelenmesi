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
proc glm data=DriversKumelemeOrneklem; 
class cluster;
model SpeedControl=cluster;
run;

proc glm data=DriversKumelemeOrneklem; 
class cluster;
model Confidence=cluster;
run;

proc glm data=DriversKumelemeOrneklem; 
class cluster;
model TheoryTest=cluster;
run;

