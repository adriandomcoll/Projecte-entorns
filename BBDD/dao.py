import mysql
import mysql.connector

def list_laps():
    """
    Connects to the MySQL database and lists all rows in the User table.
    """
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="assettocorsa_db"
    )
    cursor = connection.cursor(dictionary=True)

    try:
        query = "SELECT * FROM Laps"
        cursor.execute(query)
        laps = cursor.fetchall()

        for lap in laps:
            print(lap)
    finally:
        cursor.close()
        connection.close()


if __name__ == "__main__":
    list_laps()
