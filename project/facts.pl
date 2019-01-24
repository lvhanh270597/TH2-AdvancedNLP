vb(X) --> ["thông", "dịch"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~man..
			arg1~language..
			arg2~language..
			head~["thông", "dịch"]
		)
	)
}.

nn(X) --> ["sáng"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~time..
			arg0~often..
			head~["sáng"]
		)
	)
}.

rb(X) --> ["sẽ"], {
	X = (
		syn~( cat~rb )..
		sem~(
			cat~schedule..
			head~["sẽ"]
		)
	)
}.

rb(X) --> ["thường"], {
	X = (
		syn~( cat~rb )..
		sem~(
			cat~repeat..
			head~["thường"]
		)
	)
}.

vb(X) --> ["quen"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~man..
			arg1~woman..
			head~["quen"]
		)
	)
}.

nn(X) --> ["cấp", "hai"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~level..
			arg0~student..
			head~["cấp", "hai"]
		)
	)
}.

nn(X) --> ["tiếng"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~language..
			arg0~country..
			head~["tiếng"]
		)
	)
}.

cd(X) --> ["hai"], {
	X = (
		syn~( cat~cd )..
		sem~(
			cat~count..
			arg0~animal..
			head~["hai"]
		)
	)
}.

cd(X) --> ["hai"], {
	X = (
		syn~( cat~cd )..
		sem~(
			cat~count..
			arg0~people..
			head~["hai"]
		)
	)
}.

unn(X) --> ["con"], {
	X = (
		syn~( cat~unn )..
		sem~(
			cat~none..
			arg0~animal..
			head~["con"]
		)
	)
}.

adj(X) --> ["khôn"], {
	X = (
		syn~( cat~adj )..
		sem~(
			cat~smart..
			arg0~animal..
			head~["khôn"]
		)
	)
}.

vb(X) --> ["khôn"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~smart..
			arg0~animal..
			head~["khôn"]
		)
	)
}.

vb(X) --> ["dạy"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~woman..
			arg1~student..
			head~["dạy"]
		)
	)
}.

nn(X) --> ["anh"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~man..
			arg0~name..
			head~["anh"]
		)
	)
}.

nn(X) --> ["Anh"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~country..
			head~["Anh"]
		)
	)
}.

nn(X) --> ["Việt"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~country..
			head~["Việt"]
		)
	)
}.

nn(X) --> ["học", "sinh"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~student..
			head~["học", "sinh"]
		)
	)
}.

in(X) --> ["của"], {
	X = (
		syn~( cat~in )..
		sem~(
			cat~none..
			arg0~animal..
			arg1~people..
			head~["của"]
		)
	)
}.

cc(X) --> ["vì"], {
	X = (
		syn~( cat~cc )..
		sem~(
			cat~reason..
			head~["vì"]
		)
	)
}.

prp(X) --> ["nó"], {
	X = (
		syn~( cat~prp )..
		sem~(
			cat~thing..
			head~["nó"]
		)
	)
}.

nn(X) --> ["chú", "rể"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~man..
			head~["chú", "rể"]
		)
	)
}.

nn(X) --> ["huyền", "đề"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~none..
			arg0~animal..
			head~["huyền", "đề"]
		)
	)
}.

vb(X) --> ["sủa"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~animal..
			arg1~time..
			head~["sủa"]
		)
	)
}.

vb(X) --> ["sủa"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~animal..
			arg1~often..
			head~["sủa"]
		)
	)
}.

jj(X) --> ["nữ", "tính"], {
	X = (
		syn~( cat~jj )..
		sem~(
			cat~person..
			arg0~woman..
			head~["nữ", "tính"]
		)
	)
}.

vb(X) --> ["nuôi"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~people..
			arg1~animal..
			head~["nuôi"]
		)
	)
}.

prp(X) --> ["họ"], {
	X = (
		syn~( cat~prp )..
		sem~(
			cat~people..
			head~["họ"]
		)
	)
}.

rb(X) --> ["rất"], {
	X = (
		syn~( cat~rb )..
		sem~(
			cat~none..
			head~["rất"]
		)
	)
}.

nn(X) --> ["người"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~people..
			head~["người"]
		)
	)
}.

nn(X) --> ["cô", "dâu"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~woman..
			head~["cô", "dâu"]
		)
	)
}.

vb(X) --> ["là"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~woman..
			arg1~woman..
			head~["là"]
		)
	)
}.

vb(X) --> ["là"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~man..
			arg1~man..
			head~["là"]
		)
	)
}.

vb(X) --> ["là"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~thing..
			arg1~dog..
			head~["là"]
		)
	)
}.

in(X) --> ["với"], {
	X = (
		syn~( cat~in )..
		sem~(
			cat~none..
			arg0~talk..
			arg1~woman..
			head~["với"]
		)
	)
}.

nn(X) --> ["chó"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~animal..
			head~["chó"]
		)
	)
}.

vb(X) --> ["nói", "chuyện"], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~talk..
			arg0~man..
			arg1~woman..
			head~["nói", "chuyện"]
		)
	)
}.

in(X) --> ["qua"], {
	X = (
		syn~( cat~in )..
		sem~(
			cat~none..
			arg0~language..
			head~["qua"]
		)
	)
}.

nn(X) --> ["này"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~CATs..
			head~["này"]
		)
	)
}.

cd(X) --> ["một"], {
	X = (
		syn~( cat~cd )..
		sem~(
			cat~count..
			arg0~animal..
			head~["một"]
		)
	)
}.

nnp(X) --> ["Hùng"], {
	X = (
		syn~( cat~nnp )..
		sem~(
			cat~name..
			head~["Hùng"]
		)
	)
}.

det(X) --> ["mỗi"], {
	X = (
		syn~( cat~det )..
		sem~(
			cat~often..
			arg0~time..
			head~["mỗi"]
		)
	)
}.

nn(X) --> ["chị"], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~woman..
			arg0~name..
			head~["chị"]
		)
	)
}.

nnp(X) --> ["Hoa"], {
	X = (
		syn~( cat~nnp )..
		sem~(
			cat~name..
			head~["Hoa"]
		)
	)
}.

