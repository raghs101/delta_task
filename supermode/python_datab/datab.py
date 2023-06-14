import mysql.connector
file = open('studentDetails.txt', 'r')


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="delta@sql",
  auth_plugin='mysql_native_password'
)

mycursor = mydb.cursor()

mycursor.execute("use hostel")
lines = []
for each in file:
    each = each.strip()
    lines.append(each.split(' '))
mycursor.execute("CREATE TABLE IF NOT EXISTS studentDetail( %s varchar(255), %s int , %s varchar(255) , %s int, %s int,%s varchar(255) )"%(lines[0][0],lines[0][1],lines[0][2],lines[0][3],lines[0][4],lines[0][5]))
for i in range(1,len(lines)):
  mycursor.execute("INSERT INTO studentDetail values('%s',%d,'%s',%d,%d,'%s')"%(lines[i][0],int(lines[i][1]),lines[i][2],int(lines[i][3]),int(lines[i][4]),lines[i][5]))

mydb.commit()