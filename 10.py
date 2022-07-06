import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate
import os

# Retrievals


def selbatting_stats():
    try:
        sql = "SELECT * FROM Batting_Stats"
        cur.execute(sql)
        table = cur.fetchall()
        print("Current Batting stats")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)


def sel_venues():
    try:
        sql = "SELECT * FROM Venues"
        cur.execute(sql)
        table = cur.fetchall()
        print("All venues")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)


def max_total_runs():
    try:
        sql = "SELECT MAX(Total_Runs) FROM (SELECT DISTINCT P FROM ((SELECT Team_Code AS T1,Year AS Y1 FROM Points_Table WHERE No_Won>=3 AND Year = 2021) AS A inner join (SELECT Player_ID AS P,Team_Code AS T2 FROM Players) AS B ON A.T1 = B.T2)) AS C inner join (SELECT * FROM Batting_Stats WHERE Year = 2021) AS D ON C.P = D.Player_ID"
        cur.execute(sql)
        table = cur.fetchall()
        print(
            "Maximum of the total runs of players , whose team won >2 matches in the season")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)


def rcbwinvenues():
    try:
        sql = "SELECT DISTINCT Venue_ID FROM Matches WHERE Winner_Team = 'RCB'"
        cur.execute(sql)
        table = cur.fetchall()
        print("Venues where RCB won")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)


def avgage():
    try:
        sql = "SELECT AVG(Age) FROM Players"
        cur.execute(sql)
        table = cur.fetchall()
        print("Average age")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)


def maxcenturies():
    try:
        sql = "SELECT MAX(No_of_centuries) FROM Batting_Stats"
        cur.execute(sql)
        table = cur.fetchall()
        print("Max centuries")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)


def viratsubs():
    try:
        sql = "SELECT * FROM Players WHERE First_Name LIKE '%Virat%'"
        cur.execute(sql)
        table = cur.fetchall()
        if len(table):
            print("Players with virat as a substring of their first names")
            print()
            print(tabulate(table, headers="keys", tablefmt='psql'))
        else:
            print("No such text")

    except pymysql.Error as e:
        print(e)


def roysubs():
    try:
        sql = "SELECT * FROM Players WHERE Last_Name LIKE '%Roy%'"
        cur.execute(sql)
        table = cur.fetchall()
        if len(table):
            print("Players with Roy as a substring of their last names")
            print()
            print(tabulate(table, headers="keys", tablefmt='psql'))
        else:
            print("No such text")
    except pymysql.Error as e:
        print(e)


def rcbwins():
    try:
        sql = "SELECT (SELECT COUNT(*) AS total_wins FROM (SELECT * FROM Matches where Winner_Team = 'RCB' AND Venue_ID = 2) AS B)*100 / (SELECT COUNT(*) AS total_wins FROM (SELECT * FROM Matches where Winner_Team = 'RCB') AS A) AS PERCENTAGE"
        cur.execute(sql)
        table = cur.fetchall()
        print("rcb win percentage in M.Chinnaswamy Stadium")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

# Insert


def Insert_Umpire():
    print("Insert Umpire")
    print()

    First_Name = input("First Name: ")
    Last_Name = input("Last Name: ")
    Age = input("Age: ")
    Country = input("Country: ")
    Umpire_ID = input("Umpire_ID: ")
    query = """INSERT INTO Umpires VALUES (%s, %s, %s, %s, %s)"""

    try:
        cur.execute(query, (First_Name, Last_Name,  Age, Country, Umpire_ID))
        connection.commit()
    except Exception as e:
        print("Could not insert into the database. Check inputted values.")
        return

    query = """SELECT * FROM Umpires WHERE `Umpire_ID` = %s;"""
    cur.execute(query, (Umpire_ID))
    res = cur.fetchall()
    print("The following entry has been inserted into the database: ")
    print(tabulate(res, headers="keys", tablefmt='psql'))


def Insert_player():
    print("Insert Player")
    print()
    Player_ID = input("Player_ID: ")
    First_Name = input("First Name: ")
    Last_Name = input("Last Name: ")
    Base_Price = input("Base_Price: ")
    Age = input("Age: ")
    Batting_Style = input("Batting_Style: ")
    Bowling_Style = input("Bowling_Style: ")
    Captain_ID = input("Captain_ID: ")
    Team_code = input("Team_code: ")

    sql = "SELECT * FROM Players WHERE Captain_ID=%s AND Team_code=%s"
    cur.execute(sql, (Captain_ID, Team_code))
    table = cur.fetchall()
    if len(table):
        query = """INSERT INTO Players VALUES (%s, %s, %s, %s, %s, %s, %s, %s,%s)"""
        try:
            cur.execute(query, (Player_ID, First_Name, Last_Name, Base_Price,
                                Age, Batting_Style, Bowling_Style, Captain_ID, Team_code))
            connection.commit()
        except Exception as e:
            print("Could not insert into the database. Check inputted values.")
            return
        query = """SELECT * FROM Players WHERE `Player_ID` = %s;"""
        cur.execute(query, (Player_ID))
        res = cur.fetchall()
        print("The following entry has been inserted into the database: ")
        print(tabulate(res, headers="keys", tablefmt='psql'))
    else:
        print("Could not insert into the database. Check inputted values.")
        return

 # update


def update_no_of_matches():
    print("Update Number of Matches: ")
    print()
    Player_ID = input("Player_ID: ")

    query = """SELECT * FROM Batting_Stats WHERE `Player_ID` = %s;"""
    cur.execute(query, (Player_ID))
    table = cur.fetchall()
    if len(table):
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("No player found for this Player_ID")
        return

    res = input("Are you sure you want to update the above entry? [y/n] ")
    if res == "y" or res == "Y":
        newMatches = input("New number of matches: ")
        try:
            query = """UPDATE Batting_Stats SET `No_of_matches` = %s WHERE `Player_ID` = %s"""
            cur.execute(query, (newMatches, Player_ID))
            connection.commit()
        except Exception as e:
            print("Unable to update. Potentially invalid type for 'Number of matches'")
            return
        print("Updated the requested entry. Updated entry looks like: ")
        query = """SELECT * FROM Batting_Stats WHERE `Player_ID` = %s;"""
        cur.execute(query, (Player_ID))
        table = cur.fetchall()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("Aborted Update.")
    return


def update_match_status():
    print("Update Match Status: ")
    print()
    Match_ID = input("Match_ID: ")

    query = """SELECT * FROM Matches WHERE `Match_ID` = %s;"""
    cur.execute(query, (Match_ID))
    table = cur.fetchall()
    if len(table):
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("No matches found for this Match_ID")
        return

    res = input("Are you sure you want to update the above entry? [y/n] ")
    if res == "y" or res == "Y":
        newStatus = input("New Match Status: ")
        try:
            query = """UPDATE Matches SET `Match_Status` = %s WHERE `Match_ID` = %s"""
            cur.execute(query, (newStatus, Match_ID))
            connection.commit()
        except Exception as e:
            print("Unable to update. Potentially invalid type for 'New Status'")
            return
        print("Updated the requested entry. Updated entry looks like: ")
        query = """SELECT * FROM Matches WHERE `Match_ID` = %s;"""
        cur.execute(query, (Match_ID))
        table = cur.fetchall()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("Aborted Update.")
    return


def update_captain():
    print("Update Captain: ")
    print()
    Team_code = input("Team_code: ")

    query = """SELECT * FROM Teams WHERE `Team_code` = %s;"""
    cur.execute(query, (Team_code))
    table = cur.fetchall()
    if len(table):
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("No team found for this Team code")
        return

    res = input("Are you sure you want to update the above entry? [y/n] ")
    if res == "y" or res == "Y":
        newCaptain = input("New Captain_ID: ")
        sql = "SELECT * FROM Players WHERE Player_ID=%s"
        cur.execute(sql, (newCaptain))
        table = cur.fetchall()
        if len(table):
            try:
                query = """UPDATE Teams SET `Captain_ID` = %s WHERE `Team_code` = %s"""
                cur.execute(query, (newCaptain, Team_code))
                connection.commit()
            except Exception as e:
                print("Unable to update. Potentially invalid type for 'New Captain'")
                return
            print("1Updated the requested entry. Updated entry looks like: ")
            query = """SELECT * FROM Teams WHERE `Team_code` = %s;"""
            cur.execute(query, (Team_code))
            table = cur.fetchall()
            print(tabulate(table, headers="keys", tablefmt='psql'))
        else:
            print("2Unable to update. Potentially invalid type for 'New Captain'")
    else:
        print("Aborted Update.")
    return


# Delete

def del_player():
    print("Delete Player: ")
    print()
    Player_ID = input("Player_ID: ")

    query = """SELECT * FROM Players WHERE Player_ID = %s;"""

    cur.execute(query, (Player_ID))
    table = cur.fetchall()
    if len(table):
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("No matches found for this player")
        return

    res = input("Are you sure you want to delete the above entry? [y/n] ")
    if res == "y" or res == "Y":
        query = """DELETE FROM Players WHERE Player_ID = %s;"""
        try:
            cur.execute(query, (Player_ID))
            connection.commit()
            print("Deleted the requested entry")
        except Exception as e:
            print("Could not delete from the database.")
            return
    else:
        print("Aborted delete")


def execute(ch):
    if(ch == 1):
        selbatting_stats()
    elif(ch == 2):
        sel_venues()
    elif(ch == 3):
        rcbwinvenues()
    elif(ch == 4):
        avgage()
    elif(ch == 5):
        maxcenturies()
    elif(ch == 6):
        viratsubs()
    elif(ch == 7):
        roysubs()
    elif(ch == 8):
        max_total_runs()
    elif(ch == 9):
        rcbwins()
    elif(ch == 10):
        Insert_Umpire()
    elif(ch == 11):
        Insert_player()
    elif(ch == 12):
        update_no_of_matches()
    elif(ch == 13):
        update_match_status()
    elif(ch == 14):
        update_captain()
    elif(ch == 15):
        del_player()


while(1):
    tmp = sp.call('clear', shell=True)

    try:
        connection = pymysql.connect(host='localhost',
                                     port=30306,
                                     user="root",
                                     password="12345678",
                                     db='F11',
                                     cursorclass=pymysql.cursors.DictCursor)

        tmp = sp.call('clear', shell=True)

        if(connection.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with connection.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)

                print(" 1. Batting_Stats of players")
                print(" 2. Data tuples of Venues")
                print(" 3. Venue_Id of all the matches with RCB as Winner_Team")
                print(" 4. Average age of the Players")
                print(" 5. Maximum number of centuries scored by players")
                print(" 6. Search 'Virat' in First Names")
                print(" 7. Search 'Roy' in Last Names")
                print(
                    " 8. Maximum of the total runs of players , whose team won greater than 2 matches in the season")
                print(
                    " 9. Percentage of victories of RCB with in M. Chinnaswamy Stadium")
                print("10. Insert umpire in the Umpires Table")
                print("11. Insert player in the Players Table ")
                print("12. Update the no_of matches played by a player in Batting_Stats")
                print("13. Update Match_Status in the Matches Table")
                print("14. Modify captain in the Teams Table")
                print("15. Delete player in the Players Table")
                print("16. Logout")

                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 16:
                    exit()
                else:
                    execute(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
