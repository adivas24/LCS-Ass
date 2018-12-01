# LCS-Ass
Logic In Computer Science (CS F214) Assignment

Team: Abhinav Ramachandran (2017A7PS1176P), Aditya Vasudevan (2017A7PS0175P), and Jayanth Tummalapenta(2017A&PS0075P).

Task:
Laws in Indian Penal Code (IPC) are to be encoded in Prolog (as facts and rules).
Write a Prolog program to interpret / apply laws for a given case given a set of laws.
Three member team: Implemented Sections 4-8 of the IPC.

Our assignment submissions contain the following:

1. README.txt
2. Main code
3. Database

Description of Program:

The program aims to interpret the laws and determine the punishment for a certain offence.
It is interactive and will query the user for inputs, to determine the judgement.
As of now, the program implements the laws described in Chapters IV, V, VA, VI, VII, and VII
of the IPC with the exception of the following laws:

After loading the appropriate database, to begin execution of the program, execute the following command:

start.

User will be prompted to enter one of three modes:
1. Going through all laws one by one.
2. Selecting a subset of sections.
3. Selecting a subset of laws.

[Note. In mode 2 and 3, all laws not being selected, will be suppressed. Hence, if a selected law
is dependent on one or more of the suppressed laws, then it might fail to execute properly.
Thus, it is important to ensure that all relevant laws are included in your selection. End of Note]

After the above selection is complete, the user will be prompted to enter a name of the suspect
on trial, and the nature of the crime. Ensure that the inputs begin with a lowercase letter and is followed by a full-stop.

Following this, testing of the selected laws begins.
The program will sequentially go through the list of laws encoded and will query the user for
relevant information in the form of dichotomous questions. Only one character (and no full-stop)
needs to be given as input, else the program will not behave in the expected manner.
Entering 'y' or 'Y' will be interpreted as an affirmative. All other cases, will result in the negation.

When the program determines the judgement, it will print it out on the console.  
