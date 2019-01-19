vb(X) --> ['thông', 'dịch'], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~language..
			arg1~language..
			head~['thông', 'dịch']
		)
	)
}.

nn(X) --> ['sáng'], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~time..
			arg0~often..
			head~['sáng']
		)
	)
}.

rb(X) --> ['sẽ'], {
	X = (
		syn~( cat~rb )..
		sem~(
			cat~schedule..
			arg0~none..
			head~['sẽ']
		)
	)
}.

rb(X) --> ['thường'], {
	X = (
		syn~( cat~rb )..
		sem~(
			cat~repeat..
			arg0~none..
			head~['thường']
		)
	)
}.

vb(X) --> ['quen'], {
	X = (
		syn~( cat~vb )..
		sem~(
			cat~none..
			arg0~people..
			arg1~people..
			arg2~reason..
			head~['quen']
		)
	)
}.

nn(X) --> ['cấp', 'hai'], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~level..
			arg0~student..
			head~['cấp', 'hai']
		)
	)
}.

nn(X) --> ['tiếng'], {
	X = (
		syn~( cat~nn )..
		sem~(
			cat~language..
			arg0~country..
			head~['tiếng']
		)
	)
}.

cd(X) --> ['hai'], {
	X = (
		syn~( cat~cd )..
		sem~(
			cat~count..
			arg0~animal..
			head~['hai']
		)
	)
}.

cd(X) --> ['hai'], {
	X = (
		syn~( cat~cd )..
		sem~(
			cat~count..
			arg0~people..
			head~['hai']
		)
	)
}.

unn(X) --> ['con'], {
	X = (
		syn~( cat~unn )..
		sem~(
			cat~none..
			arg0~animal..
			head~['con']
		)
	)
}.

adj(X) --> ['khôn'], {
	X = (
		syn~( cat~adj )..
		sem~(
			cat~smart..
			arg0~animal..
			head~['khôn']
		)
	)
}.

adj(X) --> ['khôn'], {
	X = (
		syn~( cat~adj )..
		sem~(
			cat~smart..
			arg0~people..
			head~['khôn']
		)
	)
}.

