Class new title: D1Stroke
	subclassof: Object
	fields: ' name points isLong'
	declare: '';
	classified: 'D1Recognizer'

D1Stroke understands: 'rotate: ps by: rad | i p newPoints d theta 
	[newPoints _ Vector new: ps length.
	for i to: ps length do
	 [p _ ps  i.
	 d _ self dist: p and: (Point new x: 0.0 y: 0.0).
	 theta _ rad asFloat - (self theta: p).
	 newPoints  i _ d * theta cos  (0.0 - (d * theta sin))].
	newPoints]' classified: 'As yet unclassified'


D1Stroke understands: 'points
	[points]' classified: 'As yet unclassified'


D1Stroke understands: 'centroid: ps | i xs ys 
	[xs _ (ps  1) x.
	ys _ (ps  1) y.
	for i to: ps length do
	 [i > 1 
	 [xs _ xs + (ps  i) x.
	 ys _ ys + (ps  i) y]].
	Point new x: xs asFloat / ps length asFloat y: ys asFloat / ps length asFloat]' classified: 'As yet unclassified'


D1Stroke understands: 'indicativeAngle: ps | center first
	[center _ self centroid: ps.
	first _ (ps  1) - center.
	 self theta: first]' classified: 'As yet unclassified'


D1Stroke understands: 'translate: ps to: base | offset p newPoints i 
	[offset _ (self centroid: ps) - base.
	newPoints _ Vector new: ps length.
	for i to: ps length do
	 [p _ ps  i.
	 newPoints  i _ p - offset].
	newPoints]' classified: 'As yet unclassified'


D1Stroke understands: 'resample: ps with: n | input d newPoints pointsIndex dd q currentP ii lastP first
	[ii _ (self pathLength: ps) / (n - 1) asFloat.
	dd _ 0.0.
	first _ Point new x: (ps  1) x asFloat y: (ps  1) y asFloat.
	ps  1 _ first.
	input _ D1Stream new init: ps.
	pointsIndex _ 1.
	newPoints _ Vector new: n.
	newPoints  pointsIndex _ (Point new x: (ps  1) x asFloat y: (ps  1) y asFloat).
	pointsIndex _ pointsIndex + 1.
	while input atEnd  true do
	 [lastP _ input prev.
	 currentP _ input current.
	 d _ self dist: lastP and: currentP.
	 [dd + d  ii 
	 [q _ self lerp: lastP to: currentP at: (ii - dd / d).
	 newPoints  pointsIndex _ q.
	 pointsIndex _ pointsIndex + 1.
	 input push: q.
	 dd _ 0.0]
	 true  [
	 dd _ dd + d.
	 input shift]]].
	[newPoints  n  nil  [newPoints  n _ (Point new x: ps last x asFloat y: ps last y asFloat)]].
	newPoints]' classified: 'As yet unclassified'


D1Stroke understands: 'pathLength: ps | i sum lastP currentP 
	[sum _ 0.0.
	lastP _ ps  1.
	for i to: ps length do
	 [i > 1 
	 [currentP _ ps  i.
	 sum _ sum + (self dist: lastP and: currentP).
	 lastP _ currentP]].
	sum]' classified: 'As yet unclassified'


D1Stroke understands: 'preProcess | radians i
	[points _ self resample: points with: 64.
	isLong _ self isSkinny: points.
	points _ self translate: points to: 0  0.
	radians _ self indicativeAngle: points.
	points _ self rotate: points by: radians.
	points _ self scale: points to: 250.0]' classified: 'As yet unclassified'


D1Stroke understands: 'scale: ps to: s | bbExt bbx bby ss i newPoints p 
	[bbExt _ (self encompassingRectangle: ps) extent.
	bbx _ bbExt x asFloat.
	bby _ bbExt y asFloat.
	ss _ s asFloat.
	newPoints _ Vector new: ps length.
	for i to: ps length do
	 [p _ ps  i.
	 newPoints  i _ p x * ss / bbx  (p y * ss / bby)].
	newPoints]' classified: 'As yet unclassified'


D1Stroke understands: 'arctan: aFloat
	[ aFloat arctan]' classified: 'As yet unclassified'


D1Stroke understands: 'isLong
	[ isLong]' classified: 'As yet unclassified'


D1Stroke understands: 'isSkinny: ps | max min t end begin p pi i
	[end _ ps last.
	begin _ ps  1.
	pi _ 3.141592653589793.
	min _ pi.
	max _ min negated.
	for i from: 1 to: ps length do [
	 [i  (ps length / 2)	 [p _ end - (ps  i)]
	 true  [p _ (ps  i) - begin]].
	 t _ self theta: p.
	 [t > (pi * 1.5)  [t _ t - (pi * 2.0)]].
	 max _ max max: t.
	 min _ min min: t].
	 (max - min) < 0.3]
' classified: 'As yet unclassified'


D1Stroke understands: 'name
	[ name]' classified: 'As yet unclassified'


D1Stroke understands: 'theta: p | x y theta tan 
	[x _ p x.
	y _ p y.
	[x = 0 
	 [y  0  [1.5707963]
	 true  [4.712389]]].
	tan _ y asFloat / x asFloat.
	theta _ self arctan: tan.
	[x  0 
	 [y  0  [theta]
	 true  [ 6.2831853 + theta]]].
	true  [ 3.1415927 + theta]]' classified: 'As yet unclassified'


D1Stroke understands: 'lerp: a to: b at: ratio | ax ay bx by
	[ax _ a x asFloat.
	ay _ a y asFloat.
	bx _ b x asFloat.
	by _ b y asFloat.
	 Point new x: ax + ((bx - ax) * ratio) y: ay + ((by - ay) * ratio)]' classified: 'As yet unclassified'


D1Stroke understands: 'encompassingRectangle: ps | topLeft bottomRight i p
	[for i to: ps length do [
	 p _ ps  i.
	 [topLeft  nil  [
	 topLeft _ p.
	 bottomRight _ p]
	 true  [
	 topLeft _ topLeft min: p.
	 bottomRight _ bottomRight max: p]]].
	 topLeft extent: (bottomRight - topLeft)]' classified: 'As yet unclassified'


D1Stroke understands: 'dist: p1 and: p2 | dx dy 
	[dx _ p1 x asFloat - p2 x asFloat.
	dy _ p1 y asFloat - p2 y asFloat.
	(dx * dx + (dy * dy)) sqrt]' classified: 'As yet unclassified'


D1Stroke understands: 'points: ps 
	[points _ ps]' classified: 'As yet unclassified'


D1Stroke understands: 'name: aName 
	[name _ aName]' classified: 'As yet unclassified'


