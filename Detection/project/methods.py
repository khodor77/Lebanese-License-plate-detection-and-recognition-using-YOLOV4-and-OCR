import mysql.connector
import hashlib


# Note: Alter the spotted vehicle in the flagged table
def insert_captured(db, values, location):
    try:
        flagged = get_flagged(db)
        flaggednums = [x[0] for x in flagged]
        platenum = values[0]
        if platenum in flaggednums and flagged[flaggednums.index(platenum)][7] == "approved":
            time = values[1]
            plate = get_platedetails(db, platenum)
            type = plate[1]
            color = plate[2]
            query = f"""INSERT INTO `captured_plates`(`plate_number`, `Plate_type`, `plate_color`, `location`, `time`) 
            VALUES ('{platenum}','{type}','{color}','{location}','{time}')"""
            mycursor = db.cursor()
            mycursor.execute(query)
            db.commit()
        else:
            raise ValueError(
                "The inserted plate number is not flagged or approved")
    except ValueError as err:
        print(err)
    except:
        print("Error")


def add_path(db, plate_number):
    query = f"UPDATE `flagged_plates` SET `path`= 'img/{plate_number}.jpg' ,`spotted` = 1 WHERE plate_number = '{plate_number}'"
    mycursor = db.cursor()
    mycursor.execute(query)
    db.commit()


def insert_flagged(db, plate, reason, path):
    platedetails = get_platedetails(db, plate)
    typ = platedetails[1]
    color = platedetails[2]
    id = platedetails[3]
    query = """INSERT INTO `flagged_plates`(`plate_number`, `plate_type`, `plate_color`, `Reason`, `id`,`path`) 
    VALUES ('{}','{}','{}','{}','{}','{}')""".format(plate, typ, color, reason, id, path)
    print(query)
    mycursor = db.cursor()
    mycursor.execute(query)
    db.commit()


def insert_user(db, name, lname, email, password, username, phone, usertype):
    hash = hashlib.sha256()
    enc = password.encode("utf-8")

    hash.update(enc)
    hash = hash.hexdigest()

    query = """INSERT INTO `users`(`name`, `last_name`, `email`, `password`, `username`, `phone`, `usertype`) 
    VALUES ('{}','{}','{}','{}','{}','{}','{}')""".format(name, lname, email, hash, username, phone, usertype)
    mycursor = db.cursor()
    mycursor.execute(query)
    db.commit()


def insert_platedetails(db, plate, typ, color, id):
    query = """INSERT INTO `plate_details`(`plate_number`, `plate_type`, `plate_color`, `id`)
    VALUES ('{}','{}','{}','{}')
    """.format(plate, typ, color, id)
    mycursor = db.cursor()
    mycursor.execute(query)
    db.commit()


def insert_vehicleDetails(db, brand, color, typ, manf, plate, ownerID):
    query = """INSERT INTO `vehicle_details`(`brand`, `color`, `type`, `manufacture`, `Plate_number`, `ownerid`) 
    VALUES ('{}','{}','{}','{}','{}','{}')""".format(brand, color, typ, manf, plate, ownerID)
    mycursor = db.cursor()
    mycursor.execute(query)
    db.commit()


def insert_owner(db, name, last_name, mother_name, address, birthday, phone, birthplace, personal_recnum, civil_id):
    query = """INSERT INTO `vehicle_owner`(`name`, `last_name`, `mother_name`, `address`, `birthday`, `phone`, `birthplace`, `personal_recnum`, `civil_id`) 
    VALUES ('{}','{}','{}','{}','{}','{}','{}','{}','{}')
    """.format(name, last_name, mother_name, address, birthday, phone, birthplace, personal_recnum, civil_id)
    mycursor = db.cursor()
    mycursor.execute(query)
    db.commit()


def get_flagged(db):

    query = "SELECT * FROM flagged_plates "
    mycursor = db.cursor()
    mycursor.execute(query)
    return mycursor.fetchall()


def get_platedetails(db, plate):
    query = "SELECT * FROM plate_details WHERE plate_number = '{}'".format(
        plate)
    mycursor = db.cursor()
    mycursor.execute(query)
    return mycursor.fetchall()[0]


def get_ownerByID(db, id):
    query = f"SELECT * FROM vehicle_owner WHERE id = '{id}' "
    mycursor = db.cursor()
    mycursor.execute(query)

    return mycursor.fetchall()[0]


def get_ownerIdByPlate(db, plate):
    query = "SELECT id FROM plate_details WHERE plate_number = '{}'".format(
        plate)
    mycursor = db.cursor()
    mycursor.execute(query)
    return mycursor.fetchall()[0]


mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="masterthesis",
    port=3306
)
values = ('JKL789', '02:01:38.646485 2023-03-30')
add_path(mydb, 'A1357')
