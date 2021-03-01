#!/bin/bash
mkdir lj
cd lj
touch Temp.txt
echo "#Temp_initial Temp_average" >> Temp.txt
for temp in 1 4;
do
let "tmp = temp * 0.5"
let "tm = tmp - 0.5"
cd ~/repos/lj
mkdir temp_$tmp
cd ..
sed "s/all create $tm/all create $tmp/g" in.melt
srun -N 1 -p RT_study --ntasks-per-node=8 -J lammps_aver --comment="cw" ~/repos/lmp_mpi -in in.melt
temp=$(awk -f awk.sh log.lammps)
cd lj
echo "$tmp $temp" >> Temp.txt
cd temp_$tmp
touch rdf.txt
echo "#N r RDF" >> rdf.txt
tail -n 50 tmp.rdf >> rdf.txt
cd ..
cd ..
rm dump.melt
rm tmp.rdf
rm log.lammps
done
gnuplot gnuplot.sh


