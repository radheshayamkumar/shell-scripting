#!/bin/bash
<<disclaimer
This is an imaginary story
disclaimer


read -p "Enter the Gabbar's Dilauge : "gb
read -p "Enter the thakur's dilauge : "th
read -p "Kitne admi the : " admi

echp "$gb"
echo "$th"
echo "$admi"

if [[ th == "nahi" ]];
then 
    echo "Jai veeru ki entry!"
elif [[ $admi -ge 2]];  #ge : grater than equal to
then
    echo "Gabbar Lets go.."
else
    echo "Chop Chop"
fi

echo "Sholay Khatam"