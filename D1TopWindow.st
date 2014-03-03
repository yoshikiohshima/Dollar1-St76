Class new title: D1TopWindow
	subclassof: PanedWindow
	fields: ''
	declare: '';
	classified: 'Windows'

D1TopWindow understands: 'default | recog result
	[recog _ D1Window new.
	result _ D1ResultPane new.
	self title: ''Tablet'' with: recog, result at: (0  4 rect: 3636), (00 rect: 36  4).
	self newframe.
	result showing: ''''.
	self show.
	recog to: result]' classified: 'As yet unclassified'


