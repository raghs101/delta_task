
   warden_username=$USER
   hostel_name=hostel="${warden_username#*_}"
   fee_defaulters_file="/hostels/$hostel_name/feeDefaulters.txt"
   announcements_file="/hostels/$hostel_name/announcements.txt"
  

  
  
  for student_dir in /hostels/$hostel_name/*; do
     student_username=$(basename "$student_dir")
     fees_file="$student_dir/fees.txt"
    

    if grep -q "Total Amount" "$fees_file"; then
      echo "Fees paid for $student_username"
    else
      echo "Fees not paid for $student_username"
      
      
     student_details_file="$student_dir/userDetails.txt"
     student_name=$(grep "Name:" "$student_details_file" | cut -d ":" -f 2 | tr -d '[:space:]')
     student_rollnumber=$(grep "Roll Number:" "$student_details_file" | cut -d ":" -f 2 | tr -d '[:space:]')
     defaulter="$student_name:$student_rollnumber"
      echo "$line" >> "$fee_defaulters_file"
    fi
  done
  
  
  echo "Roll numbers of first 5 fee payments:"
  counter=0
  while IFS= read -r roll_number; do
    echo "$roll_number" >> "$announcements_file"
    ((counter++))
    
    if [ "$counter" -eq 5 ]; then
      break
    fi
  done < <(find "/hostels/$hostel_name" -name "fees.txt" -type f -exec grep -l "Total Amount" {} + | cut -d "/" -f 5)




