
nn(X) --> [chu, re], {
	X = (
		syn~(
			cat~nn
		)..
		sem~(
			cat~[person]..
			subcat~[man]..
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
			subcat~[woman]..
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
			subcat~[man]..
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
			subcat~[woman]..
			head~chi
		)
	)
}.
nn(X) --> [nguoi], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~[person]..
			subcat~[man, woman]..
			head~nguoi
		)
	)
}.
nn(X) --> [cho], {
	X = (
		syn~( cat~nn )..
		sem~( 
			cat~[animal]..
			subcat~[dog]..
			head~cho
		)
	)
}.

unn(X) --> [con], {
	X = (
		syn~ ( cat~unn )..
		sem~ (
			cat~[animal]..
			subcat~[dog]..
			head~con
		)
	)
}.

cd(X) --> [mot], {
	X = (
		syn~( cat~cd )..
		sem~(
			cat~[animal, person]..
			subcat~[dog, woman, man]..
			head~mot
		)
	)
}.
cd(X) --> [hai], {
	X = (
		syn~( cat~cd )..
		sem~(
			cat~[animal, person]..
			subcat~[dog, man, woman]..
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
			subcat~[man]..
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
			subcat~[woman]..
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
			subcat~[man, woman]..
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
			subcat~[dog, man, woman]..
			head~nuoi
		)
	)
}.