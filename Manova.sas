


data Drivers;
set Drivers;
run;


proc freq data = Drivers;
  table Training;
run;


/* Var-cov matrisi homojenliği testi */
proc discrim data = drivers pool=test;
  var SpeedControl Confidence TheoryTest;
  classes Training;
run;




/* Tek yönlü MANOVA */
proc glm data = drivers;
  class Training;
  model SpeedControl Confidence TheoryTest = Training / SS3;
  manova h = Training;
  means Training / tukey hovtest=levene;
run;


/* Etkileşimli MANOVA */
proc glm data = drivers;
  class Training Reactions;
  model SpeedControl Confidence TheoryTest =
        Training Reactions Training*Reactions / SS3;
  manova h = Training Reactions Training*Reactions;
  means Training Reactions / tukey;
  lsmeans Training*Reactions / adjust=tukey;
run;
