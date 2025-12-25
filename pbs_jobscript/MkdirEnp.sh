#!/bin/bash

#source the progresbar.sh

source progress_bar.sh

# first create the  array
temperature=0.0 # temperature
v0=0.0 # activity

#array=([1]='0.06' [2]='0.07' [3]='0.08' [4]='0.09' [5]='0.1' [6]='0.11' [7]='0.12' [8]='0.15' [9]='0.16')
array=([1]='0.13' [2]='0.14' [3]='0.115' [4]='0.105' [5]='0.108') # [6]='0.215' [7]='0.212' [8]='0.21' [9]='0.205' [10]='0.2')

#create the temeperature directories
prefix="s0"

for temp in ${array[*]}

do
    mkdir "${prefix}_$temp"
done

#copy makefile logfile bash and fortran files and change temperatures using "sed -i"

for index in ${!array[@]}

do

   # show_progress ${index} ${#Temp_array[@]}

    cp  makefile  *.f90 "${prefix}_${array[$index]}/"

    #cp Dump_Nstep* "${prefix}_${array[$index]}/"
    
    sleep 0.5

    cd "${prefix}_${array[$index]}"/

    #sed -i '/v0 = /c\    REAL(dp), PARAMETER    :: v0 = '${array[$index]}'_dp '   parameters.f90
    
    #sed -i '/sigma_0 = /c\    REAL(dp), PARAMETER    :: sigma_0 = '${array[$index]}'_dp '   parameters.f90
    
    #sed -i '/strain_rate = /c\    REAL(dp), PARAMETER    :: strain_rate = '${array[$index]}'_dp '   parameters.f90

    truncate -s 0 init_s0.dat
    echo "${array[$index]}" >> init_s0.dat
    
    sleep 0.5

    truncate -s 0 init_temp.dat
    echo "$temperature" >> init_temp.dat

    sleep 0.5

    truncate -s 0 init_v0.dat
    echo "$v0" >> init_v0.dat

    sleep 0.5


    #sed -i '/tf_pro = /c\    INTEGER,  PARAMETER   :: tf_pro = '${tf_array[$index]}'         !production time' epm_parameters.f90
    
    #sleep 0.5

    cd ..

    show_progress $index ${#array[@]}

done
wait

