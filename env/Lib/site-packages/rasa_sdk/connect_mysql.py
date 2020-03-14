import mysql.connector

def select(query):
    mydb = mysql.connector.connect(
              host="localhost",
              user="root",
              passwd="root",
              database="gea"
            )

    mycursor = mydb.cursor()
    mycursor.execute(query)

    result = mycursor.fetchall()
    mycursor.close()
    return result        

def insert(query):
    mydb = mysql.connector.connect(
              host="localhost",
              user="root",
              passwd="root",
              database="gea"
            )

    mycursor = mydb.cursor()
    mycursor.execute(query)
    mydb.commit()
    mycursor.close()