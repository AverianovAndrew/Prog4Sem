#!/bin/bash
mkdir lj
cd lj
touch Temp.txt
echo "#Temp_initial Temp_average" >> Temp.txt
mkdir temp_0.5
mkdir temp_1
mkdir temp_1.5
mkdir temp_2
cd ..
sed "s/all create 3.0/all create 0.5/g" in.melt
srun -N 1 -p RT_study --ntasks-per-node=8 -J lammps_aver --comment="cw" ~/repos/lmp_mpi -in in.melt
temp=$(awk -f awk.sh log.lammps)
cd lj
echo "0.5 $temp" >> Temp.txt
cd ..
cd lj
cd temp_0.5
touch rdf.txt
echo "#N r RDF" >> rdf.txt
tail -n 50 tmp.rdf >> rdf.txt
cd ..
cd ..
rm dump.melt
rm tmp.rdf
rm log.lammps
sed "s/all create 0.5/all create 1/g" in.melt
srun -N 1 -p RT_study --ntasks-per-node=8 -J lammps_aver --comment="cw" ~/repos/lmp_mpi -in in.melt
temp=$(awk -f awk.sh log.lammps)
cd lj
echo "1 $temp" >> Temp.txt
cd ..
cd lj
cd temp_1
touch rdf.txt
echo "#N r RDF" >> rdf.txt
tail -n 50 tmp.rdf >> rdf.txt
cd ..
cd ..
rm dump.melt
rm tmp.rdf
rm log.lammps
sed "s/all create 1/all create 1.5/g" in.melt
srun -N 1 -p RT_study --ntasks-per-node=8 -J lammps_aver --comment="cw" ~/repos/lmp_mpi -in in.melt
temp=$(awk -f awk.sh log.lammps)
cd lj
echo "1.5 $temp" >> Temp.txt
cd ..
cd lj
cd temp_1.5
touch rdf.txt
echo "#N r RDF" >> rdf.txt
tail -n 50 tmp.rdf >> rdf.txt
cd ..
cd ..
rm dump.melt
rm tmp.rdf
rm log.lammps
sed "s/all create 1.5/all create 2/g" in.melt
srun -N 1 -p RT_study --ntasks-per-node=8 -J lammps_aver --comment="cw" ~/repos/lmp_mpi -in in.melt
temp=$(awk -f awk.sh log.lammps)
cd lj
cd lj
echo "2 $temp" >> Temp.txt
cd ..
cd lj
cd temp_2
touch rdf.txt
echo "#N r RDF" >> rdf.txt
tail -n 50 tmp.rdf >> rdf.txt
cd ..
cd ..
rm dump.melt
rm tmp.rdf
rm log.lammps
gnuplot gnuplot.sh

