record_mess_preferences() {
  student_username=$1
  mess_preferences=$2
  hostel=$3
  student_details_file="/hostels/$3/$1/userDetails.txt"
  mess_file="/home/HAD/mess.txt"


newLine="Mess Preference : $1"

sed -i '$s|.*|'"$newLine"'|' userDetails.txt
  
  
  

  
  # Append roll number to mess.txt
  student_rollnumber=$(grep "Roll Number:" "$student_details_file" | cut -d ":" -f 2 | tr -d '[:space:]')
  line="$student_rollnumber $2"
  
  echo "$line" >> "$mess_file"
}

# Function for hostel office to allocate messes to students
allocate_messes() {
   
   mess_file="/home/HAD/mess.txt"
   mapfile -t mess_names < <(awk 'NR>=2&&NR<=4{print $1}' $mess_file)
   mapfile -t mess_capacities < <(awk 'NR>=2&&NR<=4{print $2}' $mess_file)

   
   mess_file="$mess_file"

   preferences_data=$(tail -n +6 "$mess_file")
   for index in "${!mess_names[@]}"; do
  	allocated_capacity[$((index+1))]=0
   done
   while read -r line; do
  	roll_number=$(echo "$line" | awk '{print $1}')
  	preferences=$(echo "$line" | awk '{print $2}')
    	local roll_number=$roll_number
  	local preferences=$preferences
  	local allocated_mess=""
  
  # Split the preferences into an array
  	IFS=',' read -ra preference_arr <<< "$preferences"


	  for pref in "${preference_arr[@]}"; do
	    # Check if the mess is already allocated to another student
	    if [[ ${allocated_capacity[$pref]} -lt ${mess_capacities[$pref-1]} ]]; then
	      # Allocate the mess to the student
	      allocated_capacity[$pref]=$((allocated_capacity[$pref]+1))
	      allocated_mess=$pref
	      
	      # Break the loop as mess is allocated
	      break
	    elif [[ ${allocated_capacity[$pref]} -eq 0 ]]; then
	      # Allocate the mess to the student as the first preference mess has not reached its capacity yet
	      allocated_capacity[$pref]=$((allocated_capacity[$pref]+1))
	      allocated_mess=$pref
	      

	      break
	    fi
	  done
  

  sed -i "/^$roll_number\s*$preferences/s/$preferences/$allocated_mess/" "$preferences_file"  	
  	
  done <<< "$preferences_data"



   
   
   
  
  
  
}



username = $USER
if [[ $username =~ [0-9] ]]; then
	echo "Enter The mess preference"
	read pref
	echo "Enter Hostel name"
	read hostel
	record_mess_preferences "$username" "$pref" "$hostel"
	
	
else 
	allocate_messes

