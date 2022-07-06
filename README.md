### Batting_Stats of players:
- This displays all the tuples in the table Batting_Stats.
- Enter 1 to see this.

### Data tuples of Venues:
- This displays all the tuples in the table Venues.
- Enter 2 to see this.

### Venue_Id of all the matches with RCB as Winner_Team:
- This displays all the venues where RCB won against other teams.
- Enter 3 to see this.


### Average age of the Players
- Average age of the players is displayed.
- Enter 4 to see this.


### Maximum number of centuries scored by players:
- Maximum number of centuries scored by any player is displayed.
- Enter 5 to see this.


### Search 'Virat' in First Names:
- This will display all the tuples in the table Players with 'Virat' as a substring in the attribute First_Name.
- Enter 6 to see this.

### Search 'Roy' in Last Names:
- This will display all the tuples in the table Players with 'Roy' as a substring in the attribute Last_Name.
- Enter 7 to see this. 


### Maximum of the total runs of players , whose team won greater than 2 matches in the season:
- This displays maximum total runs of a player whose team won more than 2 matches.
- Enter 8 to see this.



### Percentage of victories of RCB in M. Chinnaswamy Stadium:
- This displays the (wins for RCB in M.Chinnaswamy Stadium divided by all wins for RCB)*100.
- Enter 9 to do this.

### Insert umpire in the Umpires Table:
- Enter 10 to be able to insert a tuple of an umpire into the Umpires table.

### Insert player in the Players Table:
- Enter 11 to be able to insert a tuple of a player in the Players Table.
- The tuple is inserted if and only if the Captain is among the existing players or the new player inserted is captain i.e Captain_ID can take only the values of existing Player_ID or the inserted Player_ID.Error message is displayed if the condition is not followed.

### Update the No_of_matches played by a player in Batting_Stats:
- Enter 12 to be able to update attribute No_of_matches in the table Batting_States.
- No of matches played cannot be less than no.of innings played, this error is handled.

### Update Match_Status in the Matches Table:
- Enter 13 to update the Match_Status of a Match in the Matches Table.

### Modify captain in the Teams Table:
- Enter 14 to change the Captain for a team.
- Captain_ID can be modified.
- All the Captain_IDs in the Players table are also modified if the Captain_ID for a team changes.
- Error handling : Captain_ID is unique.Each team can have only one captain and a player can be a captain to only one team.Error message is displayed if the conditions are not followed.

### Delete player in the Players Table:
- Enter 15 to delete a player tuple in the Players Table.

### Logout:
- Enter 16 to logout of the interface.