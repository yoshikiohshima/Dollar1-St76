Class new title: D1Window
	subclassof: Window
	fields: 'recognizer'
	declare: '';
	classified: 'As yet unclassified'

D1Window understands: 'default
	[frame _ 100100 extent: 250250.
	recognizer _ D1Recognizer new.
	recognizer initTemplates]' classified: 'As yet unclassified'


D1Window understands: 'show
	[frame clear: 0]' classified: 'As yet unclassified'


D1Window understands: 'redbug | a last current t
	[a _ Stream new of: (Vector new: 20).
	last _ user mp.
	a next _ last.
	t _ Turtle new.
	t init.
	t penup.
	t goto: last.
	t pendn.
	while user redbug do [
	 current _ user mp.
	 [last  current  [
	 a next _ current.
	 t goto: current.
	 last _ current]]].
	user show: (recognizer recognize: a contents) asString.
	user cr.
	self show]' classified: 'As yet unclassified'


