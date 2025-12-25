#!/bin/bash
#PBS -l nodes=1:ppn=96
#PBS -N R.9.T0
#PBS -q workq

cd "$PBS_O_WORKDIR"

module purge
#module load gcc/gcc-9.3.0        # For K3
#module load compilers/gcc-8.3.0  # For K4
#module load gcc/11.3             # For K5

# ==== PARAMETER SELECTION ====
#array=([1]='0.25' [2]='0.24' [3]='0.23' [4]='0.225' [5]='0.22' [6]='0.215' [7]='0.212' [8]='0.21' [9]='0.205' [10]='0.2')

#array=([1]='0.25' [2]='0.225' [3]='0.22')
#array=([1]='0.15' [2]='0.18' [3]='0.23')
#array=([1]='0.2' [2]='0.205' [3]='0.21')
#array=([1]='0.06' [2]='0.07' [3]='0.08' [4]='0.09' [5]='0.1' [6]='0.11' [7]='0.12' [8]='0.15' [9]='0.16')
array=([1]='0.13' [2]='0.14' [3]='0.115' [4]='0.105' [5]='0.108')

prefix="s0"

start_ensemble=1  #(odd) 1--33--65--97--129--161
end_ensemble=96    #(even) 96--128--256--320--520
batch_size=96     # 32 for K4 // 96 for K5 // 20 for k3
# =================================== #

# Loop through ensemble batches
for ((start=$start_ensemble; start<=$end_ensemble; start+=batch_size)); do
    end=$((start + batch_size - 1))
    if (( end > end_ensemble )); then
        end=$end_ensemble
    fi

    echo "===== Processing batch $start to $end ====="

    # For each temperature value
    for temp in "${array[@]}"; do
        cd "${prefix}_$temp" #|| exit
        echo "---- Temperature $temp ----"

        # Step 1: Create folders and copy files
        for ((en=start; en<=end; en++)); do
            mkdir -p "en$en"
            cp *.f90 makefile init_*.dat "en$en/"
            sleep 0.1
            sed -i "/base_name = /c\    base_name = 'p0_3.9_init_T_0.1_ens/en$en/'" "en$en/main.f90"
            sleep 0.1
        done

        # Step 2: Compile and run in background
        for ((en=start; en<=end; en++)); do
            cd "en$en" || continue

            make
            
            sleep 0.5
            
            ./vm.out &> "out${en}.log" &

            echo "en$en  on ${prefix}_$temp"
            
            sleep 0.5
            
            rm -f *.o *.mod
           
            sleep 0.5

            cd ..
        done

        wait  # Wait for this temp's batch to finish
        cd ..
    done

    wait  # Wait for all temps in this batch before next
done

wait

