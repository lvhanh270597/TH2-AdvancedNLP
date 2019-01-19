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
			subcat~SC..
			head~H
		)
	),
	Y = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~C..
			subcat~SC..
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
			subcat~SC..
			head~H
		)
	),
	Y = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~H
		)
	)
}.
np(X) --> nn(Y), nnp(Z), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			subcat~SC..
			head~SemNN..
			comp~SemNNP
		)
	),
	Y = (
		syn~(
			cat~nn
		)..
		sem~SemNN
	),
	Z = (
		syn~(
			cat~nnp
		)..
		sem~SemNNP
	), 
	SemNN = (		
		cat~C1..
		subcat~SC1
	),
	SemNNP = (
		cat~C2..
		subcat~SC2
	),
	intersect(C1, C2, C),
	intersect(SC1, SC2, SC),
	not(empty_list(C)),
	not(empty_list(SC))
}.
np(X) --> unn(Y), nn(Z), {
	X = (
		syn~( cat~np )..
		sem~(
			cat~C..
			subcat~SC..
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
		cat~C1..
		subcat~SC1
	), 
	SemUNN = (
		cat~C2..
		subcat~SC2
	),
	intersect(C1, C2, C),
	intersect(SC1, SC2, SC),
	not(empty_list(C)),
	not(empty_list(SC))
}.
np(X) --> cd(Y), np(Z), {
	X = (
		syn~( cat~np )..
		sem~(
			cat~C..
			subcat~SC..
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
		cat~C1..
		subcat~SC1
	),
	SemCD = (
		cat~C2..
		subcat~SC2
	),
	intersect(C1, C2, C),
	intersect(SC1, SC2, SC),
	not(empty_list(C)),
	not(empty_list(SC))
}.

vp(X) --> md(_), vb(Y), np(Z), {
	X = ( 
		syn~(
			cat~vp
		)..
		sem~(
			cat~C..
			subcat~SC..
			arg1~SemNP..
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
			cat~np
		)..
		sem~SemNP
	),
	SemNP = (
		cat~C1..
		subcat~SC1
	),
	SemVB = (
		cat~C2..
		subcat~SC2
	),
	intersect(C1, C2, C),
	intersect(SC1, SC2, SC),
	not(empty_list(C)),
	not(empty_list(SC))
}.
vp(X) --> vb(Y), np(Z), {
	X = ( 
		syn~(
			cat~vp
		)..
		sem~(
			cat~C..
			subcat~SC..
			arg1~SemNP..
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
			cat~np
		)..
		sem~SemNP
	),
	SemNP = (
		cat~C1..
		subcat~SC1
	),
	SemVB = (
		cat~C2..
		subcat~SC2
	),
	intersect(C1, C2, C),
	intersect(SC1, SC2, SC),
	not(empty_list(C)),
	not(empty_list(SC))
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
		cat~C1..
		subcat~SC1
	),
	SemVP = (
		head~Head..
		cat~C2..
		subcat~SC2..
		arg1~Arg1
	), 
	intersect(C1, C2, C),
	intersect(SC1, SC2, SC),
	not(empty_list(C)),
	not(empty_list(SC))
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

show(S, np) :- np(X, S, []), g_display(X).
show(S, nn) :- nn(X, S, []), g_display(X).
show(S, nnp) :- nnp(X, S, []), g_display(X).
show(S, unn) :- unn(X, S, []), g_display(X).
show(S, vp) :- vp(X, S, []), g_display(X).
show(S, sen) :- sen(X, S, []), g_display(X).
show(S, vb) :- vb(X, S, []), g_display(X).

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

np(X) --> np(Y), pp(Z), {
	X = (
		syn~(
			cat~np
		)..
		sem~(
			cat~C..
			subcat~SC..
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
		cat~C..
		subcat~SC
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
