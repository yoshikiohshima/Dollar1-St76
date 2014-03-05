Class new title: D1TopWindow
	subclassof: PanedWindow
	fields: ''
	declare: '';
	classified: 'D1Recognizer'

D1TopWindow understands: 'default | recog result
	[recog _ D1TextPane new.
	result _ D1ResultPane new.
	self title: ''Tablet'' with: recog, result at: (0  0 rect: 3636), (00 rect: 36  0).
	self newframe.
	result showing: ''''.
	recog showing: ''abc''.
	self show.
	"recog to: result"]' classified: 'As yet unclassified'


D1TopWindow understands: 'text: text
	[(panes  1) showing: text.
	self show]' classified: 'As yet unclassified'


