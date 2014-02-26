Class new title: D1Window2
	subclassof: PanedWindow
	fields: ''
	declare: '';
	classified: 'D1Recognizer'

D1Window2 understands: 'default | recog result
	[result _ CodePane new.
	recog _ D1Window new.
	self title: ''Recognizer'' with: result, recog at: (00 rect: 20  5), (05, 2020).
	self show.
	recog to: result]' classified: 'As yet unclassified'


