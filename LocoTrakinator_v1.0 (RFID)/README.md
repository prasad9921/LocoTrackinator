# Loco Trackinator


**RFID LOCATION FINDER:**

**IDEA:**
This idea is to help students or other faculty members locate faculty members in the college( might not be with exact accuracy but near location).


**WORKING:**


**Database entry:**
A passive RFID tag is attached to every faculty member and an RFID reader will be present at landmarks around the entire college ( like at the canteen entrance, library entrance, each classroom and lab, cabins).
When a person with an ID enters a location it gets registered in the database, as a particular reader reads the ID/ tag, the certain location can be known or  the data is stored in the database based not only on which tag but also based on which reader.

**App/Software:**
A mobile application is to be designed capable of executing sql queries( assuming the database is sql) to fetch and display the location of the person searched for.(It can be any kind of application that can obtain the data from database)
The mobile app can be as simple containing a field to text the name (dropbox availability) and then displaying the location of the person.

**INVOLVED STUFF:**

-	RFID (reader, tag)
-	IoT (raspberry or Arduino with modules )
-	Mobile App dev(software)
-	Database management and queries  (software, we can make our laptop as a server or storing spot)

**APPLICATION:**

Locating the nearby landmark of a person within the accessible region.


**PROS:**
-	Students can easily find the location of the required faculty member and get to contact them without much time waste.
    
    **Personal:**
-	Experience in database handling
-	Real life application of IoT devices
-	Experience in dealing with RFID
-	Traits for coding real-life applications
-	Executable working mobile application development

**CONS:**
-	Privacy of the people
-	Cost for testing and prototyping




**Suggestions:**
Privacy issues are just personal feelings which can be avoided by making it a necessary need in the system.
Lecturing about the MNCs which freely robs our personal data for their own greed can make them realize this small breach is nothing but an effective way to provide flexibility in their daily duties.


**WORK SPLIT UP:**

Raghu:Hardware

Teju:Hardware

Ruthi:Hardware

Surya:Possibility of coding the required for app in Python.Req:Gather a few key items from the front-end of the application and those key points are to be used in code.

Jas:Database creation and maintenance, SQL queries (if database is SQL)
Suuu:Get data from app to database and database to app.

Sow:App front-end
Hayami:App front-end
Yamini:App front-end

**rfidtestgspread.py**
This is the code that continuously runs in the raspberry3 to identify the person by the RFID tag by the RFID Scanner and updates the location to the 
spread sheet hosted in Google Drive. To connect to the spread sheet in thegoogle drive you need the authorisation json file which needs to be placed in the same folder as that of the code.


