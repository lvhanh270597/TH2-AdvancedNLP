/**
['gulp4swi.pl'].
['facts.pl'].
['rules.pl'].

intersect(C1, C2, C),
intersect(SC1, SC2, SC),
not(empty_list(C)),
not(empty_list(SC))
**/

in(X, [X|_]):- !.
in(X, [H|T]) :- dif(X, H), in(X, T).

empty_list([]).

intersect([], _, []) :- !.
intersect(_, [], []) :- !.
intersect(L, [X | T], [X | Y]) :- in(X, L), intersect(L, T, Y), !.
intersect(L, [X | T], Y) :- not(in(X, L)), intersect(L, T, Y).


np(X) --> nn(Y), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			head~H
		)
	),
	Y = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~C..
			head~H
		)
	)
}.
np(X) --> prp(Y), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			head~H
		)
	),
	Y = (
		syn~(
			cat~prp
		)..
		sem~(
			cat~C..
			head~H
		)
	)
}.
np(X) --> nnp(Y), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			head~H
		)
	),
	Y = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~C..
			head~H
		)
	)
}.
np(X) --> nn(Y), nnp(Z), {
	X = (
		syn~( cat~np )..
		sem~(
			cat~C..
			arg0~C0..
			head~SemNN..
			comp~SemNNP
		)
	),
	Y = (
		syn~( cat~nn )..
		sem~SemNN
	),
	Z = (
		syn~(
			cat~nnp
		)..
		sem~SemNNP
	), 
	SemNN = (		
		cat~C..
		arg0~C0
	),
	SemNNP = (
		cat~C0
	)
}.
np(X) --> unn(Y), nn(Z), {
	X = (
		syn~( cat~np )..
		sem~(
			cat~C..
			head~SemUNN..
			comp~SemNN
		)
	),
	Y = (
		syn~( cat~unn )..
		sem~SemUNN
	)
	,
	Z = (
		syn~( cat~nn )..
		sem~SemNN
	),
	SemNN = (
		cat~C
	), 
	SemUNN = (
		arg0~C
	)
}.
np(X) --> cd(Y), np(Z), {
	X = (
		syn~( cat~np )..
		sem~(
			cat~C..
			head~SemNP..
			comp~SemCD
		)
	),
	Y = (
		syn~(
			cat~cd
		)..
		sem~SemCD
	),
	Z = (
		syn~(
			cat~np
		)..
		sem~SemNP
	), 
	SemNP = (		
		cat~C
	),
	SemCD = (
		arg0~C
	)
}.

np(X) --> np2(Y), pp(Z), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			head~SemNP..
			comp~SemPP
		)
	),
	Y = (
		sym~(
			cat~np
		)..
		sem~SemNP
	),
	Z = (
		syn~(
			cat~pp
		)..
		sem~SemPP
	), 
	SemNP = (		
		cat~C
	)
}.

np2(X) --> nn(Y), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			head~H
		)
	),
	Y = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~C..
			head~H
		)
	)
}.
np2(X) --> prp(Y), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			head~H
		)
	),
	Y = (
		syn~(
			cat~prp
		)..
		sem~(
			cat~C..
			head~H
		)
	)
}.
np2(X) --> nnp(Y), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			head~H
		)
	),
	Y = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~C..
			head~H
		)
	)
}.
np2(X) --> nn(Y), nnp(Z), {
	X = (
		syn~( cat~np )..
		sem~(
			cat~C..
			arg0~C0..
			head~SemNN..
			comp~SemNNP
		)
	),
	Y = (
		syn~( cat~nn )..
		sem~SemNN
	),
	Z = (
		syn~(
			cat~nnp
		)..
		sem~SemNNP
	), 
	SemNN = (		
		cat~C..
		arg0~C0
	),
	SemNNP = (
		cat~C0
	)
}.
np2(X) --> unn(Y), nn(Z), {
	X = (
		syn~( cat~np )..
		sem~(
			cat~C..
			head~SemUNN..
			comp~SemNN
		)
	),
	Y = (
		syn~( cat~unn )..
		sem~SemUNN
	)
	,
	Z = (
		syn~( cat~nn )..
		sem~SemNN
	),
	SemNN = (
		cat~C
	), 
	SemUNN = (
		arg0~C
	)
}.
np2(X) --> cd(Y), np(Z), {
	X = (
		syn~( cat~np )..
		sem~(
			cat~C..
			head~SemNP..
			comp~SemCD
		)
	),
	Y = (
		syn~(
			cat~cd
		)..
		sem~SemCD
	),
	Z = (
		syn~(
			cat~np
		)..
		sem~SemNP
	), 
	SemNP = (		
		cat~C
	),
	SemCD = (
		arg0~C
	)
}.

pp(X) --> in(Y), np2(Z), {
	X = (
		syn~(
			cat~pp
		)..
		sem~(
			cat~C..
			head~SemIN..
			comp~SemNP
		)
	),

	Y = (
		syn~(
			cat~in
		)..
		sem~SemIN
	),
	Z = (
		sem~SemNP
	), 
	SemIN = (
		arg1~C
	),
	SemNP = (
		cat~C
	)
}.

advp(X) --> det(Y), nn(Z), {
	X = (
		syn~(
			cat~advp
		)..
		sem~(
			cat~C0..
			head~SemDET..
			comp~SemNN
		)
	),
	Y = (
		syn~(
			cat~det
		)..
		sem~SemDET
	),
	Z = (
		syn~(
			cat~nn
		)..
		sem~SemNN
	), 
	SemDET = (
		cat~C0..
		arg1~C
	),
	SemNN = (
		cat~C
	)
}.

vp(X) --> rb(_), vb(Y), np(Z), {
	X = ( 
		syn~( cat~vp )..
		sem~(
			cat~C..
			arg0~C0..
			arg1~C1..
			arg1_sem~SemNP..
			head~SemVB
		)
	), 

	Y = (
		syn~( cat~vb )..
		sem~SemVB
	),

	Z = (
		syn~( cat~np )..
		sem~SemNP
	),
	SemNP = (
		cat~C1
	),
	SemVB = (
		cat~C..
		arg0~C0..
		arg1~C1
	)
}.

vp(X) --> vb(Y), np(Z), {
	X = ( 
		syn~( cat~vp )..
		sem~(
			cat~C..
			arg0~C0..
			arg1~C1..
			arg1_sem~SemNP..
			head~SemVB
		)
	), 

	Y = (
		syn~( cat~vb )..
		sem~SemVB
	),

	Z = (
		syn~( cat~np )..
		sem~SemNP
	),
	SemNP = (
		cat~C1
	),
	SemVB = (
		cat~C..
		arg0~C0..
		arg1~C1
	)
}.

vp(X) --> vb(Y), advp(Z), {
	X = ( 
		syn~( cat~vp )..
		sem~(
			cat~C..
			arg0~C0..
			arg1~C1..
			arg1_sem~SemADVP..
			head~SemVB
		)
	), 

	Y = (
		syn~( cat~vb )..
		sem~SemVB
	),

	Z = (
		syn~( cat~advp )..
		sem~SemADVP
	),
	SemADVP = (
		cat~C1
	),
	SemVB = (
		cat~C..
		arg0~C0..
		arg1~C1
	)
}.

sen(X) --> np(Y), vp(Z), {
	X = (
		sem~(
			nsub~SemNP..
			dobj~Arg1..
			head~Head
		)
	),

	Y = ( sem~SemNP ),

	Z = ( sem~SemVP ),

	SemNP = (
		cat~C0
	),
	SemVP = (
		head~Head..
		arg1_sem~Arg1..
		arg0~C0
	)
}.
sen(X) --> np(Y), vp(Z), {
	X = (
		sem~(
			nsub~SemNP..
			nobj~Arg1..
			head~Head
		)
	),

	Y = ( sem~SemNP ),

	Z = ( sem~SemVP ),

	SemNP = (
		cat~CS1		
	),
	SemVP = (
		head~Head..		
		arg1~Arg1
	), 
	Head = (
		cat_sub~CS2
	),
	intersect(CS1, CS2, CS),
	not(empty_list(CS))
}.

show(S, np) :- split_string(S, ' ', '', L), np(X, L, []), g_display(X).
show(S, nn) :- split_string(S, ' ', '', L), nn(X, L, []), g_display(X).
show(S, nnp) :- split_string(S, ' ', '', L), nnp(X, L, []), g_display(X).
show(S, unn) :- split_string(S, ' ', '', L), unn(X, L, []), g_display(X).
show(S, vp) :- split_string(S, ' ', '', L), vp(X, L, []), g_display(X).
show(S, sen) :- split_string(S, ' ', '', L), sen(X, L, []), g_display(X).
show(S, vb) :- split_string(S, ' ', '', L), vb(X, L, []), g_display(X).
show(S, pp) :- split_string(S, ' ', '', L), pp(X, L, []), g_display(X).
show(S, advp) :- split_string(S, ' ', '', L), advp(X, L, []), g_display(X).

/**
np(X) --> prp(Y), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemPRP
		)
	),

	Y = (
		syn~(
			cat~prp
		)..
		sem~SemPRP
	),

	SemPRP = (
		cat~C..
		subcat~SC
	)
}. 
**/

/**
np(X) --> nn(Y), prp(Z), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemNN..
			comp~SemPRP
		)
	),
	Y = (
		syn~(
			cat~nn
		)..
		sem~SemNN
	),
	SemNN = (		
		cat~C..
		subcat~SC
	),
	Z = (
		syn~(
			cat~nnp
		)..
		sem~SemPRP
	)
}.

np(X) --> dt(Y), np(Z), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemNP..
			comp~SemDT
		)
	),
	Y = (
		syn~(
			cat~dt
		)..
		sem~SemDT
	),
	Z = (
		syn~(
			cat~np
		)..
		sem~SemNP
	), 
	SemNP = (		
		cat~C..
		subcat~SC
	)
}.

np(X) --> nn(Y), np(Z), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemNN..
			comp~SemNP
		)
	),
	Y = (
		sym~(
			cat~nn
		)..
		sem~SemNN
	),
	SemNN = (		
		cat~C..
		subcat~SC
	),
	Z = (
		syn~(
			cat~np
		)..
		sem~SemNP
	)
}.

np(X) --> np(Y), adjp(Z), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemNP..
			comp~SemADJP
		)
	),
	Y = (
		sym~(
			cat~np
		)..
		sem~SemNP
	),
	SemNP = (		
		cat~C..
		subcat~SC
	),
	Z = (
		syn~(
			cat~adjp
		)..
		sem~SemADJP
	)
}.
adjp(X) --> jj(Y), {
	X = (
		syn~(
			cat~adjp
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemJJ
		)
	), 
	Y = (
		syn~(
			cat~jj
		)..
		sem~SemJJ
	), 
	SemJJ = (
		cat~C..
		subcat~SC
	)
}.
nnp(X) --> [hùng], {
	X = (
		syn~(
			cat~nnp
		)..
		sem~(
			cat~person..
			subcat~man..
			head~hùng
		)
	)
}.

adjp(X) --> rb(Y), jj(Z), {
	X = (
		syn~(
			cat~adjp
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemJJ..
			comp~SemRB
		)
	), 
	Y = (
		syn~(
			cat~rb
		)..
		sem~SemRB
	),
	Z = (
		syn~(
			cat~jj
		)..
		sem~SemJJ
	), 
	SemJJ = (
		cat~C..
		subcat~SC
	)
}.

adjp(X) --> jj(Y), jjr(Z), {
	X = (
		syn~(
			cat~adjp
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemJJ..
			comp~SemJJR
		)
	), 
	Y = (
		syn~(
			cat~jj
		)..
		sem~SemJJ
	),
	SemJJ = (
		cat~C..
		subcat~SC
	),
	Z = (
		syn~(
			cat~jjr
		)..
		sem~SemJJR
	)
}.

advp(X) --> rb(Y), {
	X = (
		syn~(
			cat~advp
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemRB
		)
	),
	Y = (
		syn~(
			cat~rb
		)..
		sem~SemRB
	), 
	SemRB = (
		cat~C..
		subcat~SC
	)
}.

advp(X) --> rb(Y), rb(Z), {
	X = (
		syn~(
			cat~advp
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemRB2..
			comp~SemRB1
		)
	),
	Y = (
		syn~(
			cat~rb
		)..
		sem~SemRB1
	),
	Z = (
		syn~(
			cat~rb
		)..
		sem~SemRB2
	), 
	SemRB2 = (
		cat~C..
		subcat~SC
	)
}.

advp(X) --> rb(Y), rbr(Z), {
	X = (
		syn~(
			cat~advp
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemRB..
			comp~SemRBR
		)
	),
	Y = (
		syn~(
			cat~rb
		)..
		sem~SemRB
	),
	SemRB = (
		cat~C..
		subcat~SC
	),
	Z = (
		syn~(
			cat~rbr
		)..
		sem~SemRBR
	)
}.

vp(X) --> vb(Y), {
	X = (
		syn~(
			cat~vp
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemVB
		)
	),
	Y = (
		syn~(
			cat~vb
		)..
		sem~SemVB
	),
	SemVB = (
		cat~C..
		head~SC
	)
}.

vp(X) --> vb(Y), vp(Z), {
	X = (
		syn~(
			cat~vp
		)..
		sem~(
			cat~C..
			subcat~SC..
			arg1~SemVP..
			head~SemVB
		)
	),

	Y = (
		syn~(
			cat~vb
		)..
		sem~SemVB
	),
	Z = (
		syn~(
			cat~vp
		)..
		sem~SemVP
	),
	SemVB = (
		cat~C..
		subcat~SC
	)
}.

vp(X) --> md(Y), vp(Z), {
	X = (
		syn~(
			cat~vp
		)..
		sem~(
			cat~C..
			subcat~SC..
			arg1~Dobj..
			head~SemVP..
			comp~SemMD
		)
	),

	Y = (
		syn~(
			cat~md
		)..
		sem~SemMD
	),
	Z = (
		syn~(
			cat~vp
		)..
		sem~SemVP
	),
	SemVP = (
		cat~C..
		subcat~SC..
		arg1~Dobj
	)
}.

vp(X) --> advp(Y), vp(Z), {
	X = (
		syn~(
			cat~vp
		)..
		sem~(
			cat~C..
			subcat~SC..
			arg1~Dobj..
			head~SemADVP..
			comp~SemVP
		)
	),

	Y = (
		syn~(
			cat~advp
		)..
		sem~SemADVP
	),
	Z = (
		syn~(
			cat~vp
		)..
		sem~SemVP
	),
	SemVP = (
		cat~C..
		subcat~SC..
		arg1~Dobj
	)
}.

vp(X) --> vp(Y), advp(Z), {
	X = (
		syn~(
			cat~vp
		)..
		sem~(
			cat~C..
			subcat~SC..
			arg1~Dobj..
			head~SemVP..
			comp~SemADVP
		)
	),

	Y = (
		syn~(
			cat~vp
		)..
		sem~SemVP
	),

	Z = (
		syn~(
			cat~advp
		)..
		sem~SemADVP
	),

	SemVP = (
		cat~C..
		subcat~SC..
		arg1~Dobj
	)
}.

vp(X) --> vp(Y), pp(Z), {
	X = (
		syn~(
			cat~vp
		)..
		sem~(
			cat~C..
			subcat~SC..
			arg1~Dobj..
			head~SemVP..
			comp~SemPP
		)
	),

	Y = (
		syn~(
			cat~vp
		)..
		sem~SemVP
	), 

	Z = (
		syn~(
			cat~pp
		)..
		sem~SemPP
	), 

	SemVP = (
		cat~C..
		subcat~SC..
		arg1~Dobj
	)
}.

vp(X) --> vb(Y), np(Z), vp(T), {
	X = (
		syn~(
			cat~vp
		)..
		sem~(
			cat~C..
			subcat~SC..
			arg1~SemNP..
			arg2~SemVP..
			head~SemVB
		)
	), 
	Y = (
		syn~(
			cat~vb
		)..
		sem~SemVB
	),

	Z = (
		sem~SemNP
	),
	T = (
		sem~SemVP
	),
	SemVB = (
		cat~C..
		subcat~SC
	)
}.

pp(X) --> in(Y), np(Z), {
	X = (
		syn~(
			cat~pp
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemIN..
			comp~SemNP
		)
	),

	Y = (
		syn~(
			cat~in
		)..
		sem~SemIN
	),
	Z = (
		sem~SemNP
	), 

	SemIN = (
		cat~C..
		subcat~SC
	)
}.
**/
