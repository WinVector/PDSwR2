# informalexample 11.5 of section 11.4.3 
# (informalexample 11.5 of section 11.4.3)  : Documentation and deployment : Deploying models : Deploying models by export 

CASE
 WHEN (`num.displays_06` >= 1517.5 AND 
       `avg.auths.per.disc_00` < 2.25 AND 
       `num.displays_06` < 2075.0) THEN ('0')
 WHEN (`num.displays_03` >= 1114.5 AND 
       `atomic.containers_01` < 9.5 AND 
       `avg.auths.per.disc_00` >= 2.25 AND 
       `num.displays_06` < 2075.0) THEN ('0')
 WHEN ...

