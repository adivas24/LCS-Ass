
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

lawmustbechecked(A,B) :- modeis(1);(modeis(2),thelistis(X),member(A,X));(modeis(3),thelistis(X),member(B,X)).

get_data :- write('What is the name of the suspect?\nDO NOT USE UPPER CASE\n'),
read(X),write('\nWhat is the crime?\nDO NOT USE UPPER CASE\n'),read(Y),
['laws'],determine_punishment(X,Y).


determine_punishment(X,Y):- no_offence(X,Y),nl,write('As per law, no offence has been committed'),endprogram,nl.
determine_punishment(X,Y):- imprisonment(X,Y,A,B),write('The punishment for '),write(X),write(', for the crime, '),
write(Y),write('\nis a prison sentence of upto '),write(A),write(' years, or a fine of Rs. '),write(B),write(', or both.'),endprogram,nl.
determine_punishment(_,_) :- write('\nUnable to determine result.\nLaw may not be defined in current scope.\nExiting.').

% Database
off_req_intent(murder).
place(place).
prop_theft(robbery).
prop_theft(theivery).
prop_theft(stealing).
arson(arson).
person(anyone).
:- dynamic mist_of_fact/1.
:- dynamic bbbl/1.
:- dynamic bjbl/1.
:- dynamic jud/1.
:- dynamic foll_jud/1.
:- dynamic acc/1.
:- dynamic misf/1.
:- dynamic inten/2.
:- dynamic prev_h/2.
:- dynamic u7/1.
:- dynamic u12/1.
:- dynamic u18/1.
:- dynamic imm/1.
:- dynamic har/2.
:- dynamic insa/1.
:- dynamic unkn/1.
:- dynamic inx_a/1.
:- dynamic inx/1.
:- dynamic fer/1.
:- dynamic cons/1.
:- dynamic oih/1.
:- dynamic ben/1.
:- dynamic gua/2.
:- dynamic s_l/1.
:- dynamic icons/1.
:- dynamic comm/2.
:- dynamic mur/1.
:- dynamic d_t/1.
:- dynamic pub_s/1.
:- dynamic rpe/2.
:- dynamic k_nap/2.
:- dynamic conf/2.
:- dynamic acd/2.
:- dynamic inst/1.
:- dynamic consp/2.
:- dynamic wful/1.
:- dynamic conc/2.
:- dynamic misrep/1.
:- dynamic consq/2.
:- dynamic pres/1.
:- dynamic succ_cr/1.
:- dynamic mis/3.
:- dynamic coll_arm/2.
:- dynamic spr_h/1.
:- dynamic rpp/1.
:- dynamic esc/1.
:- dynamic cust/2.
:- dynamic death_pen/1.
:- dynamic sold/1.
:- dynamic sz/2.
:- dynamic memof/2.
:- dynamic vio/1.
:- dynamic pub_tr/1.
:- dynamic pub_in/1.
:- dynamic pub_di/1.
:- dynamic fig/2.
:- dynamic ni/1.
:- dynamic ni/2.
:- dynamic pub_p/1.
:- dynamic dist_p/2.
:- dynamic aslt/2.
:- dynamic supri/2.
:- dynamic dstd/1.
:- dynamic husb/2.
:- dynamic ishp/1.
:- dynamic onr/2.
:- dynamic unkn/2.
:- dynamic tok/1.
:- dynamic armd/1.
:- dynamic afry/1.
:- dynamic disp/1.
:- dynamic supp_r/1.
:- dynamic inc_r/2.
:- dynamic inc_v/1.
:- dynamic pow/1.
:- dynamic rin/1.
:- dynamic mast/2.
:- dynamic hird/3.

endprogram :-
retractall(thelistis(_)),
retractall(mist_of_fact(,)),
retractall(bbbl(_)),
retractall(bjbl(_)),
retractall(jud(_)),
retractall(foll_jud(_)),
retractall(acc(_)),
retractall(misf(_)),
retractall(inten(_,_)),
retractall(prev_h(_,_)),
retractall(u7(_)),
retractall(u12(_)),
retractall(u18(_)),
retractall(imm(_)),
retractall(har(_,_)),
retractall(insa(_)),
retractall(unkn(_)),
retractall(inx_a(_)),
retractall(inx(_)),
retractall(fer(_)),
retractall(cons(_)),
retractall(oih(_)),
retractall(ben(_)),
retractall(gua(_,_)),
retractall(icons(_)),
retractall(comm(_,_)),
retractall(mur(_)),
retractall(d_t(_)),
retractall(pub_s(_)),
retractall(rpe(_,_)),
retractall(k_nap(_,_)),
retractall(conf(_,_)),
retractall(acd(_,_)),
retractall(inst(_)),
retractall(consp(_,_)),
retractall(wful(_)),
retractall(conc(_,_)),
retractall(misrep(_)),
retractall(consq(_,_)),
retractall(pres(_)),
retractall(succ_cr(_)),
retractall(mis(_,_,_)),
retractall(coll_arm(_,_)),
retractall(spr_h(_)),
retractall(rpp(_)),
retractall(esc(_)),
retractall(cust(_,_)),
retractall(death_pen(_)),
retractall(sold(_)),
retractall(sz(_,_)),
retractall(memof(_,_)),
retractall(vio(_)),
retractall(pub_tr(_)),
retractall(pub_in(_)),
retractall(pub_di(_)),
retractall(fig(_,_)),
retractall(ni(_)),
retractall(ni(_,_)),
retractall(pub_p(_)),
retractall(dist_p(_,_)),
retractall(aslt(_,_)),
retractall(supri(_,_)),
retractall(dstd(_)),
retractall(husb(_,_)),
retractall(ishp(_)),
retractall(onr(_,_)),
retractall(unkn(_,_)),
retractall(tok(_)),
retractall(armd(_)),
retractall(afry(_)),
retractall(disp(_)),
retractall(supp_r(_)),
retractall(inc_r(_,_)),
retractall(inc_v(_)),
retractall(pow(_)),
retractall(rin(_)),
retractall(mast(_,_)),
retractall(hird(_,_,_)).
