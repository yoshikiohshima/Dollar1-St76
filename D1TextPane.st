Class new title: D1TextPane
	subclassof: CodePane
	fields: 'recognizer result pen'
	declare: '';
	classified: 'D1Recognizer'

D1TextPane understands: 'to: r
	[result _ r]' classified: 'As yet unclassified'


D1TextPane understands: 'frame_ t1 
	[frame _ t1]' classified: 'As yet unclassified'


D1TextPane understands: 'init
	[super init.
	recognizer _ D1Recognizer new.
	recognizer initTemplates.

	pen _ Turtle new.
	pen batch: false.
	pen color: black.
	pen init]' classified: 'As yet unclassified'


D1TextPane understands: 'redbug | a last current r
	[a _ Stream new of: (Vector new: 20).
	last _ user mp.
	a next _ last.
	pen penup.
	pen goto: last.
	pen pendn.
	while user redbug do [
	 current _ user mp.
	 [last  current  [
	 a next _ current.
	 pen goto: current.
	 last _ current]]].
	[a contents length > 1  [
	 r _ recognizer recognize: a contents.
	 [(r  1) = ''line''  [self handleLineGesture: r stroke: a contents]
	 self handleGesture: r stroke: a contents]]
	self handleClick: a contents  1].
	self show]' classified: 'As yet unclassified'


D1TextPane understands: 'handleClick: p
	[pared select: (pared charofpoint: p).
	self show]
	' classified: 'As yet unclassified'


D1TextPane understands: 'handleGesture: r stroke: ps | s rect
	[(r  1) = ''rectangle''  [
	 s _ D1Stroke new.
	 rect _ s encompassingRectangle: ps.
	 pared frame_ rect]
	[nil  result  [result text: r asString]]]' classified: 'As yet unclassified'


D1TextPane understands: 'handleLineGesture: r stroke: ps | startX
	[startX _ (ps  1) x.
	[frame origin x < startX and [(frame origin x + 30) > startX]
	  [pared alignment _ 1]
	(frame center x - 30) < startX and [startX < (frame center x + 30)]
	  [pared alignment _ 2]
	frame corner x > startX and [(frame corner x - 30) < startX]
	  [pared alignment _ 4]]
	]' classified: 'As yet unclassified'


