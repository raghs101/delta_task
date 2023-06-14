
payFee() {
   studentDir=$1 
   feeBreakupFile="$home/feeBreakup.txt" 
   feesFile="$studentDir/fees.txt" 


  local -A feeBreakup
  while IFS=' ' read -r category percentage; do
    feeBreakup[$category]=$percentage
  done < "$feeBreakupFile"


  echo "Fee Breakup:"
  for category in "${!feeBreakup[@]}"; do
    echo "$category: ${feeBreakup[$category]}%"
  done


   totalAmount=0
  for category in "${!feeBreakup[@]}"; do
    read -rp "Enter the amount paid for $category: " amount
    totalAmount=$((totalAmount + amount))
  done


  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "Payment made on $timestamp:" >> "$feesFile"
  echo "Total Amount: $totalAmount" >> "$feesFile"
  for category in "${!feeBreakup[@]}"; do
    local percentage=${feeBreakup[$category]}
    local categoryAmount=$((totalAmount * percentage / 100))
    echo "$category: $categoryAmount" >> "$feesFile"
  done
  echo >> "$feesFile"

  echo "Fee payment successful!"
}

home = $HOME
user = $USER
payfee "$home" "$user"

