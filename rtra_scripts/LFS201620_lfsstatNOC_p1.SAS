DATA work.lfstats5digNOC;
SET RTRAdata.LFS201620 (keep = ID PROV AGE LFSSTAT NOC_5 SMTH SYEAR);

/* Province B.C.*/
if PROV = 59;

/* Age 15 or over */
if AGE >= 15;

/*Labour Force Status employed*/

if LFSSTAT IN (1,2);

/*First half of the NOCS plus missing*/

if NOC_5 < 50000;
if missing(NOC_5) then NOC_5="missing";

run;

%RTRAFreq(
     InputDataset=work.lfstats5digNOC,
     OutputName=stat1620NOCp1,
     ClassVarList= SYEAR SMTH NOC_5,
     UserWeight=FINALWT);
run;
