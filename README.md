#Logic In Computer Science (CS F214) Assignment

##Team:
- Abhinav Ramachandran (2017A7PS1176P)
- Aditya Vasudevan (2017A7PS0175P)
- Jayanth Tummalapenta (2017A7PS0075P)

##Task:
Laws in Indian Penal Code (IPC) are to be encoded in Prolog (as facts and rules).
Write a Prolog program to interpret / apply laws for a given case given a set of laws.
Three member team: Implemented Sections 4-8 of the IPC.

##Submission Contents:

Our assignment submission contains the following:

1. README.txt
2. Main code (test.pl)
3. Laws (laws.pl)
4. Database (db.pl)

##Description of Program:

The program aims to interpret the laws and determine the punishment for a certain offence.
It is interactive and will query the user for inputs, to determine the judgement.
As of now, the program implements the laws described in Chapters IV, V, VA, VI, VII, and VIII of the IPC with the exception of the following laws:

86,102,105,114,150,157

These laws have not been explicitly made into prolog statements, either because they are very similar to previous laws, or because we did not fully understand them.

After loading test.pl (command is '[\'test\']'), (backslashes in the aforementioned command are to be ignored) to begin execution of the program, execute the following command:

'start.'

The user will be prompted to enter one of three modes:
1. Going through **all** laws one by one.
2. Selecting a **subset of sections**.
3. Selecting a **subset of laws**.

*[Note. In mode 2 and 3, all laws that are not selected, will be suppressed. Hence, if a selected law is dependent on one or more of the suppressed laws, then it might fail to execute properly. Thus, it is important to ensure that all relevant laws are included in your selection.  Similarly, if the inputted crime is 'mutiny', and the laws in the user-inputted selection do not pertain to 'mutiny', then the program will fail to give the appropriate punishment. This is an intended feature, not a bug. End of Note]*

*[Note. The laws in section 5 of the IPC are with regard to abetment. Thus, if section 5 is in the user selection, the program will take the trial for **Abetment** of the specified crime, not for the crime itself.]*

After the above selection is complete, the user will be prompted to enter a name of the suspect on trial, and the nature of the crime. Ensure that the inputs begin with a lowercase letter and are followed by a full-stop.

Following this, testing of the selected laws begins.
The program will sequentially go through the list of laws encoded and will query the user for relevant information in the form of dichotomous questions. Only one character (and no full-stop) needs to be given as input, **else the program will not behave in the expected manner.**
Entering '1.' will be interpreted as an affirmative. **All other inputs will result in negation.**

When the program determines the judgement, it will print it out on the console.  

Sample Run:
?- start.
This program operates in three modes.
Mode 1 will use all
 laws in the Indian Penal Code Sections 4-8.
Mode 2 will allow you to choose
 specific sections.
Mode 3 allows you to select specific laws in the range 76-160(inclusive),
  to use.
Which mode would you like to use?
 Please remember to put a full-stop
  at the end of your selection.
|: 2.

You have selected Mode Two.
What law sections do you want to check?
Please enter a number between 4 and 8 (inclusive)
Note: Inputs need to end with a full-stop.

|: 6.

Do you want to add one more?
Please enter a number between 4 and 8 (inclusive)
Enter 0 if you have finished choosing.
Note: Inputs need to end with a full-stop

|: 0.

You have selected
[6]
What is the name of the suspect?
DO NOT USE UPPER CASE
Remember to put a full-stop at the end.
|: jay.

What is the crime?
DO NOT USE UPPER CASE
Remember to put a full-stop at the end.
|: murder.
Has jay received any plundered property?
Enter 1. for yes anything else for no.
Remember to put a full-stop at the end.
|: 0.

Was jay intoxicated?
Enter 1. for yes anything else for no.
Remember to put a full-stop at the end.
|: 1.

Was jay intoxicated against his/her will?
Enter 1. for yes anything else for no.
Remember to put a full-stop at the end.
|: 0.

The punishment for jay, for the crime, murder
is a prison sentence of up to 15 years or suitable fine
true .

==END

Improper termination of the program will result in an unstable state. Please re-run prolog to retry the program.
As a good practice, it is advisable to restart (reload) the program after every execution of the program.

This program was tested on:
- Ubuntu 16.04 (64-bit), SWI Prolog version 7.2.3
- Windows 10 (64-bit), SWI Prolog version 7.6.4
