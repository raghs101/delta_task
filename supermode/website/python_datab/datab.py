import mysql.connector
file = open('studentDetails.txt', 'r')


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="delta@sql",
  auth_plugin='mysql_native_password'
)
lines = []
for each in file:
    each = each.strip()
    lines.append(each.split(' '))
mycursor = mydb.cursor()
mycursor.execute('use passwd')




for i in range(1,len(lines)):
	mycursor.execute('INSERT into passwd values("%s","%s")'%(lines[i][0],lines[i][1]))
	mydb.commit()
	



