#!bin/bash 

echo "---server Pwerformance Stats ---"


#Total CPU usage

echo -e "\nTotal CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{print "CPU Usage: " 100 - $8 "%"}'



#Total memory usage 
echo -e "\nMemory Usage:"
free -h | awk '/^Mem:/ {print "Total: "$2, "\nUsed: "$3, "\nFree: "$4, "\nUsage: "($3/$2)*100 "%"}'

#Total disk usage
echo -e "\nDisk Usage:"
df -h --total | awk '/^total/ {print "Toatal: "$2, "\nUsed: "$3, "\nFree: "$4, "\nUsage: "$5}'

# Top 5 processes by memory msage
echo -e "\nTop 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem |head - 6 

#Top 5 procssed by cpu usage
echo -e "\nTop 5 Processess by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu |head -n 6