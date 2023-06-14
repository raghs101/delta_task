

HOSTELS_DIRECTORY="/hostels"

for hostel_dir in "$HOSTELS_DIRECTORY"/*; do
  if [ -d "$hostel_dir" ]; then
  	hostel_name=$(basename "$hostel_dir")
    
    for room_dir in "$hostel_dir"/*; do
      if [ -d "$room_dir" ]; then
      		
        
        for student_dir in "$room_dir"/*; do
          if [ -d "$student_dir" ]; then
            
            student_username=$(basename "$student_dir")

            # Set ownership and permissions for the student's home directory
		 chmod 700 $student_dir

		 setfacl -m u:$student_username:rw /home/HAD/mess.txt
		 setfacl -m u:$student_username:r /hostels/$hostel_name/feeDefaulters.txt
		 setfacl -m u:$student_username:r /hostels/$hostel_name/announcements.txt
		
          fi
        done
      fi
    done
  fi
done
#Warden permissions

 for hostel_dir in /hostels/*; do
     hostel_name=$(basename "$hostel_dir")
     warden_username= "warden_$hostel_name"
     warden_homedir= "/hostels/$hostel_name"
    
    # Allow wardens to view and edit files of students in their respective hostel
     setfacl -R -m u:$warden_username:rwx /hostels/$hostel_name
  done
  
  
for other_hostel_dir in /hostels/*; do
    local other_hostel_name=$(basename "$other_hostel_dir")
    
    if [ "$other_hostel_name" != "$warden_username" ]; then
       setfacl -m "u:$warden_username:0" "$other_hostel_dir"
    fi
  done
 #HAD permission
   setfacl -R -m u:HAD:rwx /hostels
   setfacl -R -m u:HAD:rwx /home/HAD


