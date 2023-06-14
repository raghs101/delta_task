#!/bin/bash
#create root user HAD
useradd -m -s /bin/bash HAD -d /home/HAD
echo "HAD:HAD" | chpasswd


 touch "/home/HAD/mess.txt"

#creating dirs for hostel
for i in GarnetA GarnetB Agate Opal
	do
	   mkdir -p /hostels/$i
	   touch /hostels/$i/announcements.txt
	   touch /hostels/$i/feeDefaulters.txt
	 done
#creating warden account and dirs

for i in GarnetA GarnetB Agate Opal
	do 
	   username="warden_$i"
	    useradd -m -s /bin/bash -d /hostels/$i $username
        echo "$username:$username" | chpasswd

	done
#file passed
create_update_studentinfo() {
	 mkdir -p /hostels/$3/$5
	 useradd -m -s /bin/bash  -d /hostels/$3/$5/$2 $2
	echo "$2:$2" | chpasswd
	 touch /hostels/$3/$5/$2/userDetails.txt
	 touch /hostels/$3/$5/$2/fees.txt
	#insering details
	    echo "Name: $1" >> /hostels/$3/$5/$2/userDetails.txt
	    echo "Roll Number: $2" >> /hostels/$3/$5/$2/userDetails.txt

	    echo "Hostel: $3" >> /hostels/$3/$5/$2/userDetails.txt
	    echo "RoomNo : $4">>/hostels/$3/$5/$2/userDetails.txt
	    echo "Allocated Mess: $5" >> /hostels/$3/$5/$2/userDetails.txt
	    echo "Mess Preferences: $6" >> /hostels/$3/$5/$2/userDetails.txt
	
	
}
if [ -z "$1" ]; then
    # Prompt for manual input if no file is provided
    echo "Enter student information in the format:"
    echo "Name RollNumber Hostel AllocatedMess MessPreferences"
    echo "Press Ctrl+D on a new line to stop entering data."



    while read -r line; do
        fields=($line)
        name="${fields[0]}"
        roll_number="${fields[1]}"

        hostel="${fields[2]}"
        room="${fields[3]}"
        allocated_mess="${fields[4]}"

        mess_preferences="${fields[5]}"

        create_update_studentinfo "$name" "$roll_number"  "$hostel" "$allocated_mess" "$room" "$mess_preferences"
    done
else

    file=$1
    if [ ! -f "$file" ]; then
        echo "File not found!"
        exit 1
    fi


   

    while read -r line; do

        fields=($line)
        name="${fields[0]}"
        roll_number="${fields[1]}"

        hostel="${fields[2]}"
        room="${fields[3]}"
        allocated_mess="${fields[4]}"

        mess_preferences="${fields[5]}"

        create_update_studentinfo "$name" "$roll_number"  "$hostel" "$allocated_mess" "$room" "$mess_preferences"
    done < "$file"
fi

	   
	
