#! /bin/bash
menuOption=""

adduser(){ 
user= $username
group= $group


echo "enter username :"
read username
echo "enter group name :"
read group

echo "system will add user to group"
sudo usermod -a -G "$group" "$username"
 
echo "user has been added to the selected group" 
}

view(){
group= $group


echo "Enter group name"
read  group
echo "Please wait"
grep $group /etc/group

echo "Process complete"
}

deleteuser(){
user= $username
group= $group



echo "Enter username :"
read username

echo "Enter Groupname :"
read group

sudo deluser $username $group 

echo "User has been Deleted"
}

permission(){
group= $group
   

echo "Enter Groupname :"
read group

echo "Enter permission :"
read permission
}

runaudit(){

sleep 3s

sudo ausearch -f /var/www/html/site1 --input-logs > /home/charles/Documents/Lab6/Researchlog.txt

echo "complete"
}


startbackup1(){
sleep 5
sudo chmod ugo=rx /var/www/html/
sudo cp -r /var/www/html/site1/*  /home/charles/Documents/Lab6/backup1/
sudo chmod ugo=rwx /var/www/html/
echo "Backup Complete"
}

updatewebsite(){
sleep 5
sudo chmod ugo=rx /var/www/html/
sudo cp -r /var/www/html/publishedpdf/  /var/www/html/site1
sudo chmod ugo=rwx /var/www/html/
echo "Update Complete"
}

checksyshealth(){
user= $username
sudo sar 1 5 >>/var/www/html/health.txt
echo "Enter username :"
read  username
echo "system health check in progress"

echo "system health check complete"
}

while [ "$menuOption" != "q" ]
do
	clear
	echo "main menu"
	echo "....." 

    	echo "1. Add User To Group"
    	echo "2. View Group"
    	echo "3. Delete user from Group"
    	echo "4. Assign Permission"
    	echo "5. Run Audit"
    	echo "6. Back up website"
    	echo "7. update website"
    	echo "8. Check system Health"
    	echo "q. close program"
    
	read -p "enter a number (1-8) q to quit:" menuOption
	clear
	echo "menu option selected: $menuOption"

	case $menuOption in
    		"1")
    			echo "Add User To Group" 
        		adduser
        		;;
    		"2")
    			echo "View Group" 
        		view
        		;;
    		"3")
    			echo "Delete user from Group" 
        		deleteuser
        		;;
    		"4")
    			echo "Assign Permission"
       	 	permission
        		;;
        	"5")
        	        echo "Run Audit"
        	        runaudit
        	        ;;
        	"6")    
        	        echo "Back up website"
        	        startbackup1
        	        ;;
        	"7")    
        	        echo "Update website"
        	        updatewebsite
        	        ;; 
        	"8")    
        	        echo "Check system Health"
        	        checksyshealth
        	        ;;
        	                    	
	esac
	read -p "press any key to continue:" temp

done
