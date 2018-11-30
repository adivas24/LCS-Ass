
start :- write("This program operates in three modes.\nMode 1 will use all laws in the Indian Penal Code Sections 4-8.\nMode 2 will allow you to choose specific sections.\nMode 3 allows you to select specifc laws in the range 76-160(inclusive), to use.\nWhich mode would you like to use?\n"),
read(X),checkmode(X).

checkmode(1) :- write("You have selected Mode One.\n"),assert(modeis(1)),outcome([]).
checkmode(2) :- write("You have selected Mode Two.\n"),assert(modeis(2)),starttwo.
checkmode(3) :- write("You have selected Mode Three.\n"),assert(modeis(3)),startthree.
checkmode(_) :- write("Please choose a correct mode.\n\n"),start.

starttwo :- modeis(2),write('What law sections do you want to check?'),nl,
write('Please enter a number between 4 and 8 (inclusive)'),nl,
write('**Note: Inputs need to end with a fullstop'),nl,nl,
read(X),nl,(((X>3),(X<9),moretwo([X]));
write('Invalid law. Please restart program'),!).

moretwo(List) :- write('Do you want to add one more?'),nl,
write('Please enter a number between 4 and 8 (inclusive)'),nl,
write('Enter 0 if you have finished choosing.'),nl,
write('**Note: Inputs need to end with a fullstop'),nl,nl,
read(X),nl,(((X>3),(X<9),moretwo([X|List]));((X is 0),write(List),outcome(List));
write('Invalid input. Exiting. Execute start. to restart the program.'),!).

startthree :- modeis(3),write('What laws do you want to check?'),nl,
write('Please enter a number between 76 and 160 (inclusive)'),nl,
write('**Note: Inputs need to end with a fullstop'),nl,nl,
read(X),nl,(((X>75),(X<161),morethree([X]));
write('Invalid law. Please restart program'),!).

morethree(List) :- write('Do you want to add one more?'),nl,
write('Please enter a number between 76 and 160 (inclusive)'),nl,
write('Enter 0 if you have finished choosing.'),nl,
write('**Note: Inputs need to end with a fullstop'),nl,nl,
read(X),nl,(((X>75),(X<161),morethree([X|List]));((X is 0),write(List),outcome(List));
write('Invalid input. Exiting. Execute start. to restart the program.'),!).

outcome(List) :- assert(thelistis(List)),get_data.

lawmustbechecked(A,B) :- modeis(1);modeis(2),thelistis(X),member(A,X);modeis(3),thelistis(X),member(B,X).

%Facts
off_req_intent(murder).
place(place).
prop_theft(robbery).
prop_theft(theivery).
prop_theft(stealing).
arson(arson).
person(anyone).
%Rules

get_data :- write('What is the name of the suspect?\n'),read(X),write('\nWhat is the crime?\n'),read(Y),determine_punishment(X,Y).

determine_punishment(X,Y):- no_offence(X,Y),nl,write('As per law, no offence has been committed'),nl.
determine_punishment(X,Y):- imprisonment(W,X,Y,Z),write('The punishment for '),write(W),write(', for the crime, '),
write(X),write('\nis a prison sentence of upto '),write(Y),write(' years, or a fine of Rs. '),write(Z),write(', or both.').

provide_option :- nl,write('Press y for yes anything else for no.'),nl,get(Y),nl,((Y is 89);(Y is 121)).
mistake_of_fact(_) :- write('Is this a case of mistaken fact?'),provide_option.
believes_bound_by_law(X) :- write('Did '),write(X),write(' believe that he/she was bound by law to do so?'),provide_option.
believes_justified_by_law(X) :- write('Did '),write(X),write(' believe that he/she was justified by law to do so?'),provide_option.
judge(X) :- write('Was '),write(X),write(' a judge of the court?'),provide_option.
following_judgement(X):- write('Was '),write(X),write(' following the judgement of a court or public servant?'),provide_option.
accident(_) :- write('Was this an accident?'),provide_option.
misfortune(_) :- write('Would you classify this as a misfortune?'),provide_option.
intention(X,Crime) :- write('Was it the intention of '),write(X),write(' to perform the crime, '),write(Crime),write("?"),provide_option.
prevent_harm(X,Z) :- write('Was '),write(X),write(' trying to save '),write(Z),write('?'),provide_option.
under7(X) :- write('Is '),write(X),write(' under the age of 7?'),provide_option.
under12(X) :- write('Is '),write(X),write(' under the age of 12?'),provide_option.
under18(X) :- write('Is '),write(X),write(' under the age of 18?'),provide_option.
immature(X) :- write('Is '),write(X),write(' not mature enough to comprehend his actions?'),provide_option.
harms(X,Y) :- write('Did '),write(X),write(' harm '),write(Y),write('?'),provide_option.
crazy(X) :- write('Is '),write(X),write(' clinically insane?'),provide_option.
unknowing(X) :- write('Was '),write(X),write(' unanware of the consequences?'),provide_option.
intoxicated_against_will(X):- write('Was '),write(X),write(' intoxicated against his/her will?'),provide_option.

intoxicated(X) :- write('Was '),write(X),write(' intoxicated?'),provide_option.
fear(Y) :- write('Was '),write(Y),write(' forced to give consent due to fear?'),provide_option.
consent(Y) :- not(fear(Y);mistake_of_fact(Y);under12(Y);crazy(Y);intoxicated(Y)),not(unknowing(Y)).
offence_ind_of_harm(Y) :- write('Is '),write(Y),write(' an offense, irrespective of the harm it causes?'),provide_option.
benefit(Y) :- write('Was the purpose of the act to benefit '),write(Y),write('?'),provide_option.
guardian(X,Y) :- write('Is '),write(X),write(' the guardian of '),write(Y),write('?'),provide_option.
save_life(Y) :- write('Was the purpose of the act to save the life of '),write(Y),write('?'),provide_option.
imp_consent(Y) :- write('Was '),write(Y),write(' incapable of giving consent?'),provide_option.
communicate(X,Z) :- write('Did '),write(X),write(' communicate some information which harmed '),write(Z),write('?'),provide_option.
murder(X) :- write('Was '),write(X),write(' killed?'),provide_option.
death_threat(X) :- write('Was '),write(X),write(' under threat of death?'),provide_option.
public_servant(X) :- write('Was/Is '),write(X),write(' a public servant?'),provide_option.
rape(X,Y) :- write('Did '),write(X),write('attempt to rape '),write(Y),write('?'),provide_option.
kidnapping(X,Y) :- write('Did '),write(X),write('attempt to kidnap/abduct '),write(Y),write('?'),provide_option.
confinement(X,Y) :- write('Did '),write(X),write('attempt to wrongfully confine '),write(Y),write('?'),provide_option.
acid(X,Y) :- write('Did '),write(X),write('attempt to throw acid on '),write(Y),write('?'),provide_option.
instigates(X) :- write('Has '),write(X), write(' instigated anyone to commit the crime?'),provide_option.
instigates(X) :- willful(X),(concealment(X,_);misrepresentation(X)).
conspires(X,Y) :- write('Has '),write(X),write(' engaged in a conspiracy with '),write(Y),write(' towards the crime?'),provide_option.
willful(X) :- write('Did '), write(X), write(' perform the act of his own will?'),provide_option.
concealment(X,_) :- write('Did '), write(X), write(' conceal facts related to the case?'),provide_option.
misrepresentation(X) :- write('Has '), write(X), write(' been involved in misrepresentation?'),provide_option.
is_a_consequence(P,Z) :- write('Is '), write(P), write(' a consequence of '), write(Z), write('?'),provide_option.
isPresent(X) :- write('Was '), write(X), write(' present at the scene at the time?'),provide_option.
success_crime(Z) :- write('Was the crime '), write(Z), write(' successful?'),provide_option.
misleads(X,Y,Z) :- write('Has '), write(X), write(' misled '), write(Y), write(' in regards to '), write(Z),write('?'),provide_option.
collect_arms(X, Y) :- write('Has '), write(X), write(' engaged in the collection of arms for the purpose of '), write(Y), write('?'),provide_option.
spread_hatred(X) :- write('Has '), write(X), write(' brought or attempted to bring into hatred or contempt, or excited or attempted to
excite disaffection towards, the Government established by law?'),provide_option.
receive_plundered_property(X) :- write('Has '), write(X), write(' recieved any plundered property?'),provide_option.
escapes(Y) :- write('Has '), write(Y), write(' escaped from custody?'),provide_option.
custody(X,Y) :- write('Did '),write(X),write(' have '),write(Y), write(" in custody, or harbour "),write(Y),write("?"),provide_option.

no_offence(X,_) :- lawmustbechecked(4,76),mistake_of_fact(X), (believes_bound_by_law(X); believes_justified_by_law(X)).
no_offence(X,_) :- judge(X), believes_justified_by_law(X).
no_offence(X,_) :- following_judgement(X).
no_offence(X,_) :- (accident(X); misfortune(X)), not(intention(X,_)).
no_offence(X,_) :- person(Y),person(Z), harms(X,Y), not(intention(X,_)), prevent_harm(X,Z).
no_offence(X,_) :- under7(X);(under12(X), immature(X)).
no_offence(X,_) :- crazy(X), unknowing(X).
no_offence(X,Y) :- intoxicated_against_will(X), (off_req_intent(Y);unknowing(X)).
no_offence(X,Z) :- not(intention(X,Z)), harms(X,Y), consent(Y), not(under18(Y)), not(offence_ind_of_harm(Z)).
no_offence(X,Z) :- not(intention(X, murder)),consent(Y),benefit(Y), not(offence_ind_of_harm(Z)).
no_offence(X,Z) :- person(Y),benefit(Y),(under12(X);crazy(X)),consent(Z),guardian(Z,Y),not(intention(X, murder);not(unknowing(X));abetment(X,Y,_),not(save_life(Y))), not(offense_ind_of_harm(Z)).
no_offence(X,Z) :- benefit(Y),(consent(Y);imp_consent(Y)),not(intention(X, murder)),(unknowing(X);save_life(Y)),not(abetment(_,_,Z)).
no_offence(X,_) :- communicate(X,Y),benefit(Y).
no_offence(X,Z) :- not(murder(Z)),not(death_penalty(X,Z)),death_threat(X),not(intention(X,Z)).
no_offence(X,_) :- person(Y),not(harms(X,Y)).
no_offence(X,_) :- private_def(X).

private_def(Y) :- (offence(X,_),harms(X,Y));offence(X,Z),prop_theft(Z),not(cond_for_no_private_defense(X,Y)).
private_def(Y) :- not(offence(X)),(under12(X);immature(X);crazy(X);intoxicated(X);mistake_of_fact(X)),not(cond_for_no_private_defense(X,Y)).
private_def(Y) :- murder(Y,X),cond1(X,Y).
private_def(Y) :- not(murder(Y,X)),offense(X,Y,Z),prop_theft(Z).

cond1(X,Y) :- death_threat(Y);rape(X,Y);kidnapping(X,Y);confinement(X,Y);acid(X,Y);(offense(X,Y,Z),(prop_theft(Z);arson(Z))).
cond_for_no_private_defense(X,Y) :- not(harms(X,Y));(public_servant(X),believes_justified_by_law(X));following_judgement(X);(murder(Y,X),not(cond1(X,Y))).

%Rules

abetment(X,Y,_) :- instigates(X);conspires(X,Y);not(unknowing(X)).
abetment(X,K,Z) :- criminal_conspiracy(X,Z), death_penalty(K,Z).
abetment(X,_,Z) :- abetment(Y,_,Z), abetment(X,Y,_).
abetment(X,Y,Z) :- write('Did '),write(X),write(' abet '),write(Y),write(' in commiting the crime '),write(Z),write("?"),provide_option.

abettor(X,Z):-   not(under7(X)), not(crazy(X)), not(immature(X)), abetment(X,_,Z).

offence(X,Z):- abetment(X,_,Z).
offence(X,Z) :- abettor(X,Z).
offence(X,Z) :- abetment(X,Y,Z), offence(Y,P), (P \= Z).
offence(X,P) :- abetment(X,Y,Z), offence(Y,P),is_a_consequence(P,Z), not(unknowing(X)).
offence(X,Z) :- abettor(X,Z), isPresent(X,Z).
offence(X,Z) :- offence_ind_of_harm(Z),not(no_offense(X,Z)).
offence(X,Y) :- intoxicated(X), not(intoxicated_against_will(X)), off_req_intent(Y).
offence(Y,Z) :-  unlawful(Assem),memberof(X,Assem),offence(X,Z),memberof(Y,Assem),intention(Assem,Z).
offence(X,Crime) :- write('Did '),write(X),write('commit the crime: '),write(Crime),write("?"),provide_option.


quart_imprisonment(X,Z,_) :- abetment(X,Y,Z), not(success_crime(Z)), not(public_servant(X)), not(public_servant(Y)).
quart_imprisonment(X,Z,_) :- misleads(X,Y,Z), public_servant(X),not(success_crime(Z)), not(death_penalty(Y,Z)).
quart_imprisonment(X,Z,_) :- misleads(X,Y,Z), not(public_servant(X)), success_crime(Z), not(death_penalty(Y,Z)).

eighth_imprisonment(X,Z,_) :- misleads(X,Y,Z), not(public_servant(X)), not(success_crime(Z)), not(death_penalty(Y,Z)).

criminal_conspiracy(X,Z) :- agreement(X,Y,Z), intention(X,Z), intention(Y,Z).

half_imprisonment(X,Z,_) :- abetment(X,Y,Z), not(success_crime(Z)), (public_servant(X);public_servant(Y)).
half_imprisonment(X,Z,_) :- misleads(X,Y,Z), public_servant(X), success_crime(Z), not(death_penalty(Y,Z)).

imprisonment(X,Z,10,_) :- misleads(X,Y,Z), public_servant(X), success_crime(Z), death_penalty(Y,Z).
imprisonment(X,Z,7,_) :- abetment(X,Y,Z), death_penalty(Y,Z), not(success_crime(Z)), not(harms(Y,_)).
imprisonment(X,Z,14,_) :- abettor(X,Y,Z), death_penalty(Z), not(success_crime(Z)), harms(Y,_).
imprisonment(X,Z,7,_) :- misleads(X,Y,Z), death_penalty(Y,Z), success_crime(Z).
imprisonment(X,Z,3,_) :- misleads(X,Y,Z), death_penalty(Y,Z), not(success_crime(Z)).
imprisonment(X,Z,0.5,_) :- criminal_conspiracy(X,Z), not(death_penalty(X,Z)).
imprisonment(X,_,200,_) :- criminal_conspiracy(X, war).
imprisonment(X,war,200,_) :- collect_arms(X, war), intention(X, war).
imprisonment(X, war, 10, _) :- intention(Y, war), concealment(X,Y).
imprisonment(X, _, 7, _) :- assault(X, vip), intention(X, restrain).
imprisonment(X, _, 200, _) :- spread_hatred(X).
imprisonment(X, _, 200, _) :- abetment(X,_, war1) ; success_crime(war1).
imprisonment(_, war2, 7, _) :- success_crime(war2).
imprisonment(X, _, 7, _) :- receive_plundered_property(X).
imprisonment(X, _, 200, _) :- public_servant(X), custody(X, Y), escapes(Y), intention(X, escape).
imprisonment(X, _, 3, _) :- public_servant(X), custody(X, Y), escapes(Y), not(intention(X, escape)).
imprisonment(X, _, 200, _) :- prisoner(Y), (escapes(Y) ; concealment(X,Y)), intention(X, escape).
imprisonment(X, _, 3, Z) :- abetment(X,Assem,Z),size(Assem,Y),(Y>10).
imprisonment(X,abetment,3,_) :-  abetment(X,Y, assault),soldier(Y),assaults(Y,Z),superior(Z,Y),not(success_crime(assault)),not(soldier(X)).
imprisonment(X,abetment,7,_) :-  abetment(X,Y, assault),soldier(Y),assaults(Y,Z),superior(Z,Y),success_crime(assault),not(soldier(X)).
imprisonment(X,abetment,2,_) :-  abetment(X,Y, desertion),soldier(Y),not(soldier(X)).
imprisonment(X,harbor,2,_) :-  soldier(Y),deserted(Y),custody(Y,X),not(husband(X,Y)),not(soldier(X)).
imprisonment(X,negligance,0,500) :-  is_ship(V),owner(X, V),in(Y,V),soldier(Y),deserted(Y),unknowing(X,Y),not(soldier(X)).
imprisonment(X,insubordination,0.5,_) :-  abetment(X,Y, insubordination),soldier(Y),success_crime(insubordination),not(soldier(X)).
imprisonment(X,wearingmilitarytoken,0.25,500) :-  not(soldier(X)),wears_military_token(X).
imprisonment(X,assembling,0.5,_) :-  unlawful_Assem_mem(X,_),not(armed(X)).
imprisonment(X,assembling,2,_)  :-  unlawful_Assem_mem(X,_),armed(X).
imprisonment(X,assembling,2,_) :-  unlawful_Assem_mem(X,Assem),commanded_to_disperse(Assem).
imprisonment(X,assembling,2,_) :-  rioting(X).
imprisonment(X,assembling,3,_) :-  rioting(X),armed(X).
imprisonment(X,assembling,0.5,_) :-  commanded_to_disperse(Assem),memberof(X, Assem).
imprisonment(X,assembling,0.25,_) :-  (assaults(X,Y);threatens_to_assault(X,Y)),public_servant(Y),tried_to_suppress_riot(Y).
imprisonment(Y,inciting_riot,1,_) :-  rioting(X),incite_riot(Y,X).
imprisonment(Y,inciting_riot,0.5,_) :-  not(rioting(X)),incite_riot(Y,X).
imprisonment(X,inciting,3,_) :-  (incite_hatred(X); incite_violence(X)),not(in(Z)),placeOfWorship(Z).
imprisonment(X,inciting,5,_) :-  (incite_hatred(X); incite_violence(X)),in(Z),placeOfWorship(Z).
imprisonment(X,being_armed,0.5,2000) :-  place(Assem),armed(X),in(X, Assem).
imprisonment(X,incitehatred,0.25,_) :-  incite_class_hatred(X),not(in(Z)),placeOfWorship(Z).
imprisonment(X,incite_hatred,5,_) :-  incite_class_hatred(X),in(Z),placeOfWorship(Z).
imprisonment(X, allow_riot,0,1000) :-  place(Z),((unlawful(Assem),in(Assem,Z));(rioting_happened_in(Z),master(X,Z))),intention(X,allow_Assembly).
imprisonment(X,harbouring,0.5,_) :-  custody(Y,X),unlawful_Assem_mem(Y,_).
imprisonment(X,hired_unlawful,0.5,_) :-  person(Y),hired(X, Y, unlawful_Assem),not(armed(X)).
imprisonment(X,hired_unlawful,2,_) :-  person(Y),hired(X, Y, unlawful_Assem),armed(X).
imprisonment(X,affray,0.08333,100) :-  person(Y),affray(X,Y).
imprisonment(Y,affray,0.08333,100) :-  person(X),affray(X,Y).

imprisonment(X, Z, 777, 0) :- half_imprisonment(X,Z,_).
imprisonment(X, Z, 888, 0) :- quart_imprisonment(X,Z,_).
imprisonment(X, Z, 999, 0) :- eighth_imprisonment(X,Z,_).
imprisonment(X, Z, 15, 0) :- offence(X,Z).
imprisonment(X, Z, 1111, 0) :- death_penalty(X,Z).

death_penalty(X,war) :- abetment(X,_,war) ; success_crime(war).
death_penalty(_,Z) :- write('Is this offence, '),write(Z),write(' punishable by death?'),provide_option.
death_penalty(X,mutiny) :- abetment(X,Y, mutiny),soldier(Y),success_crime(mutiny),not(soldier(X)).
death_penalty(X,mutiny) :- (abetment(X,Y, mutiny);seduce(X,Y)),soldier(Y),not(success_crime(mutiny)),not(soldier(X)).


%THE_CRIME
soldier(X) :- write('Is '),write(X),write(' a soldier?'),provide_option.

%SIZE
size(Assem,Y) :- write('What is the size of the assembly, '),write(Assem),write('?'),read(Y).

%THE_CRIME

memberof(X,Assem) :- write('Was '),write(X),write('a member of the assembly'), write(Assem), write("?"),provide_option.
violent(X) :- write('Was '),write(X),write(' violent?'),provide_option.
publishes_class_traitor(X) :- write('Did '),write(X),write(' publish any imputation that any community of persons cannot bear true faith and allegiance to the Constitution of India or uphold the sovereignty and integrity of India?'),provide_option.
publishes_class_inhuman(X) :- write('Did '),write(X),write(' publish that any community of persons shall be denied or deprived of their rights as citizens of India?'),provide_option.
publishes_class_disharmony(X) :- write('Did '),write(X),write(' publish an assertion, counsel, plea or appeal concerning the obligation of any community of persons that causes or is likely to cause disharmony or feelings of enmity or hatred or ill-will between the community and other persons?'),provide_option.
fight(X,Y) :- write('Were '),write(X),write(" and "),write(Y),write(' fighting?'),provide_option.
in(X) :- write('Did this event take place in '),write(X),write('?'),provide_option.
in(X,Y) :- write('Was '),write(X),write(' in '),write(Y),write(' during the incident?'),provide_option.
public_place(X) :- write('Is '),write(X),write('a public place?'),provide_option.
disturb_the_peace(X,Y) :- write('Did '),write(X), write("and"), write(Y) ,write(' disturb the peace?'),provide_option.
assaults(X,Y) :- write('Did '),write(X),write(' assault '),write(Y),write("?"),provide_option.
superior(X,Y) :- write('Is '),write(X),write(' the superior of '),write(Y),write("?"),provide_option.
deserted(X) :- write('Did '),write(X),write('desert the armed forces?'),provide_option.
husband(X,Y) :- write('Is '),write(X),write(' the husband of '),write(Y),write("?"),provide_option.
is_ship(X) :- write('Is '),write(X),write('a ship?'),provide_option.
owner(X,Y) :- write('Is '),write(X),write('the owner of '),write(Y),write("?"),provide_option.
unknowing(X,Y) :- write('Was '),write(X),write('unknowing of '),write(Y),write("?"),provide_option.
wears_military_token(X) :- write('Did '),write(X),write(' wear a military token?'),provide_option.
armed(X) :- write('Was '),write(X),write('armed or in possesion of a weapon?'),provide_option.
commanded_to_disperse(X) :- write('Was '),write(X),write(' commanded to disperse?'),provide_option.

tried_to_suppress_riot(X) :- write('Did '),write(X),write(' try to surpress a riot?'),provide_option.
incite_riot(X,Y) :- write('Did '),write(X),write('try to incite'),write(Y),write("to riot?"),provide_option.
incite_violence(X) :- write('Did '),write(X),write('try to incite violence?'),provide_option.
placeOfWorship(X) :- write('Is '),write(X),write('a place of worship?'),provide_option.
rioting_happened_in(X) :- write('Did rioting happen in '),write(X),write('?'),provide_option.
master(X,Y) :- write('Was '),write(X),write(' the master of '),write(Y),write("?"),provide_option.
hired(X,Y,Assem) :- write('Did '),write(X),write(' try to hire '),write(Y),write(" for "), write(Assem), write("?"),provide_option.


%soldier

unlawful(Assem) :- size(Assem,Y),Y >= 5, (intention(Assem,assault);intention(Assem,resist_law);intention(Assem,mischief);intention(Assem,robbery);intention(Assem,abet)).
unlawful_Assem_mem(X,Assem) :-  memberof(X, Assem),unlawful(Assem).
rioting(X) :-  violent(Assem),unlawful(Assem),memberof(X,Assem).
incite_class_hatred(X) :-  publishes_class_traitor(X);publishes_class_inhuman(X);publishes_class_disharmony(X).
affray(X,Y) :-  fight(X,Y),in(X,Z),in(Y,Z),public_place(Z),disturb_the_peace(X,Y).
