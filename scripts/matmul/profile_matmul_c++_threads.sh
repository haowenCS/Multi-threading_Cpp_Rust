# Profiles for the given case

# Create Logging directory
mkdir ./../../data
mkdir ./../../data/matmul

save_path="./../../data/matmul/c++"
mkdir ${save_path}

exec_c="matmul-c++"

# Make sure executable is present in the given path
c_exec_path="./../../C++/bin"

size=(1024 2048)

echo "--------------------------------------------------------------------------"
echo "Performing Parallel Runs"
echo "--------------------------------------------------------------------------"
cc="-c 2"
for t in 1 2 4 6 8 12 16
do 
  echo "/***************** ${t} Threads *********************/"

  for s in 0 1
  do
    flag="-s ${size[${s}]} -r 3 -t ${t}"
    echo "${c_exec_path}/${exec_c} ${flag} ${cc} > ${save_path}/thread_${t}_${size[${s}]}.log"
    ${c_exec_path}/${exec_c} ${flag} ${cc} > ${save_path}/thread_${t}_${size[${s}]}.log
  done

  echo ""
  echo ""
done

