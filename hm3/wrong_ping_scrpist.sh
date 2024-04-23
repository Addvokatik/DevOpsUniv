#!/bin/bash

# Адреса сайту для пінгування
website="http://localhost:3000/"

# Кількість спроб пінгування
attempts=3

# Файл для запису результатів
output_file="wrong_ping_result.txt"

# Цикл для обмеження кількості спроб
for ((i=1; i<=$attempts; i++)); do
    # Пінгуємо сайт та перенаправляємо вивід у null, щоб не виводити його на екран
    if ping -c 1 $website > /dev/null 2>&1; then
        # Якщо пінг успішний
        echo "Сайт доступний"
        echo "Сайт доступний" >> $output_file
        break  # Вихід із циклу
    else
        # Якщо пінг не вдається
        echo "Спроба $i: Сайт не доступний"
        echo "Спроба $i: Сайт не доступний" >> $output_file
        if [ $i -eq $attempts ]; then
            # Якщо це остання спроба і пінг не вдається, записати помилку в файл
            echo "Не вдалося підключитися до сайту $website" >> $output_file
        fi
    fi
    # Затримка між спробами
    sleep 5
done







#!/bin/bash

ping_resource() {
    local hostname="$1"
    ping_result=$(ping -n 1 "$hostname")
    echo "$ping_result"
}


timeout_duration=20
start_time=$(date +%s)

while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ $elapsed_time -ge $timeout_duration ]; then
        echo "Timeout reached. Exiting loop."
        exit 1
        break
    fi
    
	ping_resource "google.com"
	
	ping -n 1 google.com > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "Ping successful"
		break
	else
		echo "Ping unsuccessful"
		exit 1
	fi
	
done


echo "The end"
 
sleep 2




