% Database


off_req_intent(murder).
place(place).
prop_theft(robbery).
prop_theft(theivery).
prop_theft(stealing).
arson(arson).
person(anyone).

isRobbery(stealing).
isRobbery(robbery).
isRobbery(theft).
isRobbery(loot).
isamurder(murder).

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
