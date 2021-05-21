#!/bin/bash
touch res1.txt
touch res2.txt
for i in 10 12 14 16 18 20;
do
let "ind = i - 2"
let "cnt = (i - 10) / 2 + 1"
sed "s/charmmfsh 8 $ind/charmmfsh 8 $i/g" in.cmap$ind > in.cmap$i
srun -N 1 --ntasks-per-node=1 -p RT_build -J lammps_cmap --comment="lammps test cmap" lmp_mpi -in in.cmap$i
temp1=$(awk -f awk.sh log.lammps)
echo "$cnt $temp1" >> res1.txt
temp2=$(awk -f awk2.sh log.lammps)
echo "$cnt $temp2" >> res2.txt
rm log.lammps
done