from pathlib import Path

import mysql
import mysql.connector
import json
def dbConnect():
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="assettocorsa_db"
    )
    return connection

def list_laps():
    """
    Connects to the MySQL database and lists all rows in the User table.
    """
    connection = dbConnect()
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

def getStatsFromFile():
    script_dir = Path(__file__).parent
    file_path = script_dir / "JSON_CARRERA.json"
    with open(file_path, "r", encoding="utf-8") as file:
        all_data = json.load(file)

    laps_data = all_data.get("Laps", [])

    extracted_laps = []

    for lap in laps_data:
        driver_guid = lap.get("DriverGuid")
        driver_name = lap.get("DriverName")
        lap_time = lap.get("LapTime")

        sectors = lap.get("Sectors", [])

        s1 = sectors[0] if len(sectors) > 0 else 0
        s2 = sectors[1] if len(sectors) > 1 else 0
        s3 = sectors[2] if len(sectors) > 2 else 0

        lap_record = (driver_guid, driver_name, lap_time, s1, s2, s3)
        extracted_laps.append(lap_record)

    print(f"Extracted {len(extracted_laps)} laps total. Here are all of them:")
    for row in extracted_laps[:len(extracted_laps)]:
        print(row)

if __name__ == "__main__":
    getStatsFromFile()