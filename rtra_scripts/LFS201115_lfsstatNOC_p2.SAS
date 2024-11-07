DATA work.lfstats5digNOC;
SET RTRAdata.LFS201115 (keep = ID PROV AGE LFSSTAT NOC_5 SMTH SYEAR);

/* Province B.C.*/
if PROV = 59;

/* Age 15 or over */
if AGE >= 15;

/*Labour Force Status employed*/

if LFSSTAT IN (1,2);

/*Second half of the NOCS, missing in other half*/

if NOC_5 > 49999;

run;

%RTRAFreq(
     InputDataset=work.lfstats5digNOC,
     OutputName=stat1115NOCp2,
     ClassVarList= SYEAR SMTH NOC_5,
     UserWeight=FINALWT);
run;
