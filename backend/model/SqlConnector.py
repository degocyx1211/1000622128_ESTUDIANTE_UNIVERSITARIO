import mysql.connector

import os
from dotenv import load_dotenv



class SqlConnect():

    def __init__(self, hostname, port,userName,password,dbname):
      
        self.hostname=hostname
        self.port=port
        self.userName=userName
        self.password=password
        self.dbname=dbname
        self.connection = None
 
    def __enter__(self):
        self.connection = mysql.connector.connect(host=self.hostname,user=self.userName,passwd=self.password,port=self.port,database=self.dbname)
        return self.connection
 
    def __exit__(self, exc_type, exc_value, exc_traceback):
        self.connection.close()


def Instance(query,type):
    load_dotenv()
    hostname=os.getenv('host_name')
    port=os.getenv('port')
    userName=os.getenv('user_name')
    password=os.getenv('user_password')
    dbname=os.getenv('db_name')
    

    with SqlConnect(hostname, port,userName,password,dbname) as conex:
        cursor = conex.cursor()
        x=cursor.execute(query)
        if type == 1:
            myresult = cursor.fetchall()  
            
        elif type == 2:
            conex.commit()
            myresult=cursor.lastrowid
        return myresult
        
    
       

     



