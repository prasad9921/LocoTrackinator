LocoTrackinator:

	IDEA: 
		This idea is to help students or other faculty 
		members locate faculty members in the college
		( might not be with exact accuracy but near location).

	User side usage:
		Users will have two ways to know the locations
		of the person(s) they want to locate. They are as follows:
		Webapplication / Webpage:
			Users are provided with a URL to connect
			and search. Users with low privilize will
			not have any Login and can locate only few
			people where as the Users with privilize will 
			have Login id and password to search for all (more people) 
			the people available.
		Mobile application:
			Users are provided with a mobile application 
			to search for the people the want to locate and 
			similar to the Web application mobile application 
			also has two types of privilized Users with Login and without Login.
			
	Company side usage:
		These people are provided with the Databse to create
		user profiles, login id(s).They are also responsible for 
		collection of data for Training set ( this can be done during 
		the registration of ID card for the company).
		These people have to take care about the Databse and other commercial
		stuff involved in this.
	
	Hardware and Algorithm coherence:
		Currently the hardware used in the system is the Cameras.
		The camera sends the feed to the Algorithm which runs in a 
		main computer / cloud as an	input and the algorithm returns the
		ID and Location of people observed as the output into the Databse.
		
	API with Web and Mobile application:
		API we designed here is a REST api and this api deals with the
		updating of the fields in Databse, taking input from fields of
		both the applications and performing the quiery and returning the
		values/data back to the applications.
		
	Password encryption:
		As we all know that storing password(s) as plain text causes 
		many security issues even thought the stored locations are more 
		/most secured databases. To address this issue we stored the encrypted
		password with the popular sha 256 algorithm and stored them in Databse.
		The request  sent from any of the applications for the password is sent
		encrypted in sha 256 algorithm for better secured exchanges of packets.
		
	Checkpoint System:
		Insted of constantly monitering the people in then organisation we opted
		for a Checkpoint system whichobserves the people at certain locations
		which are termed as Checkpoint.When a person reaches this Checkpoint,
		they gets recognized by the system and their location gets updated based
		on the Checkpoint. With this we can assure we do not monitor people 
		continously rather we just view at certain spots called Checkpoints.