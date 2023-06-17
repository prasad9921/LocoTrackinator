This Project helps users to locate the person within the organization.
Users can search the persons based on their privileges:
* Students can search for faculty (to reach them out based on their availability in urgent times like assignment deadlines, project discussions)
* Faculty can search both students and their colleagues 
* Higher officials can search all the members and can look into few statistics also.

Available as a Web app, Mobile app, Desktop app

Locating persons can be done using 2 approaches:
* RFID
* Face Recognition (Haar Cascade)

RFID:
Every member of the organization must wear an ID card. In every ID card, an RFID tag is inserted by default. RFID readers have to be installed in some checkpoints when a person crosses that checkpoint the Reader senses the tag in that ID card, and every ID should be maintained unique to update the location of individual person. By this whenever a person crosses an RFID reader, their location will be updated.

Organizations might have too many checkpoints to cover all the locations properly. Installing more RFID readers is not recommended (cost inefficiency). So, another approach is using the Camera feed and implementing Face Recognition.

Face Recognition:
Organizations will have cameras in all the areas covering all locations in the organization. On these cameras' feed, applying face recognition will give us information about the person's identity (name/id) and where he's recognized (location). With this, we can have the updated location of the person. But this approach depends on the accuracy of the algorithm used. (We used Haar Cascade)

User flow:
* Login (students can login directly with their id, faculty and officials need to enter their credentials)
* Search for a member (based on privileges)
* Update status (for faculty and higher officials in order to show their availability)