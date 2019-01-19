nn(X) --> [chu, re], {
	X = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~[person]..
			head~[chu, re]
		)
	)
}.
nn(X) --> [co, dau], {
	X = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~[person]..
			head~[co, dau]
		)
	)
}.
nn(X) --> [anh], {
	X = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~[person]..
			head~anh
		)
	)
}.
nn(X) --> [chi], {
	X = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~[person]..
			head~chi
		)
	)
}.
nn(X) --> [nguoi], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~[person]..
			head~nguoi
		)
	)
}.
nn(X) --> [cho], {
	X = (
		syn~( cat~nn )..
		sem~( 
			cat~[animal]..
			head~cho
		)
	)
}.

unn(X) --> [con], {
	X = (
		syn~ ( cat~unn )..
		sem~ (
			cat~[animal]..
			head~con
		)
	)
}.

cd(X) --> [mot], {
	X = (
		syn~( cat~cd )..
		sem~(
			cat~[animal, person]..
			head~mot
		)
	)
}.
cd(X) --> [hai], {
	X = (
		syn~( cat~cd )..
		sem~(
			cat~[animal, person]..
			head~hai
		)
	)
}.

nnp(X) --> [hung], {
	X = (
		syn~(
			cat~nnp
		)..
		sem~(
			cat~[person]..
			head~hung
		)
	)
}.
nnp(X) --> [hoa], {
	X = (
		syn~(
			cat~nnp
		)..
		sem~(
			cat~[person]..
			head~hoa
		)
	)
}.

md(X) --> [se], {
	X = (
		syn~(
			cat~md
		)..
		sem~(
			head~se
		)
	)
}.

vb(X) --> [la], {
	X = (
		syn~(
			cat~vb
		)..
		sem~(
			cat~[animal, person]..
			head~la
		)
	)
}.
vb(X) --> [nuoi], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat_sub~[person]..
			cat~[animal, person]..
			head~nuoi
		)
	)
}.
