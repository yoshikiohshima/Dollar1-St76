Class new title: D1Stroke
	subclassof: Object
	fields: 'name points'
	declare: ''

D1Stroke understands: 'centroid: t1 | t2 t3 t4 
	[t3 _ (t1  1) x.
	t4 _ (t1  1) y.
	for t2 to: t1 length do
	 [t2 > 1 
	 [t3 _ t3 + (t1  t2) x.
	 t4 _ t4 + (t1  t2) y]].
	Point new x: t3 asFloat / t1 length asFloat y: t4 asFloat / t1 length asFloat]' classified: 'As yet unclassified'


D1Stroke understands: 'dist: t1 and: t2 | t3 t4 
	[t3 _ t1 x asFloat - t2 x asFloat.
	t4 _ t1 y asFloat - t2 y asFloat.
	(t3 * t3 + (t4 * t4)) sqrt]' classified: 'As yet unclassified'


D1Stroke understands: 'indicativeAngle: t1 | t2 t3
	[t2 _ self centroid: t1.
	t3 _ (t1  1) - t2.
	 self theta: t3]' classified: 'As yet unclassified'


D1Stroke understands: 'translate: t1 to: t2 | t3 t4 t5 t6 
	[t3 _ (self centroid: t1) - t2.
	t5 _ Vector new: t1 length.
	for t6 to: t1 length do
	 [t4 _ t1  t6.
	 t5  t6 _ t4 - t3].
	t5]' classified: 'As yet unclassified'


D1Stroke understands: 'add: t1 to: t2 beforeIndex: t3 | t4 t5 t6 
	[t4 _ t2 copy: 1 to: t3 - 1.
	t5 _ t2 copy: t3 to: t2 length.
	t6 _ Vector new: 1.
	t6  1 _ t1.
	(t4 concat: t6) concat: t5]' classified: 'As yet unclassified'


D1Stroke understands: 'resample: t1 with: t2 | t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 
	[t10 _ (self pathLength: t1) / (t2 - 1) asFloat.
	t7 _ 0.0.
	t3 _ t1 copy.
	t6 _ 1.
	t5 _ Vector new: t2.
	t5  t6 _ (Point new x: (t1  1) x asFloat y: (t1  1) y asFloat).
	t6 _ t6 + 1.
	t12 _ 2.
	while t12  t3 length do
	 [t11 _ t3  (t12 - 1).
	 t9 _ t3  t12.
	 t4 _ self dist: t11 and: t9.
	 [t7 + t4  t10 
	 [t8 _ self lerp: t11 to: t9 at: (t10 - t7 / t4).
	 t5  t6 _ t8.
	 t6 _ t6 + 1.
	 t3 _ self add: t8 to: t3 beforeIndex: t12.
	 t7 _ 0.0]
	 true  [t7 _ t7 + t4]].
	 t12 _ t12 + 1].
	[t5  t2  nil  [t5  t2 _ (Point new x: t3 last x asFloat y: t3 last y asFloat)]].
	t5]' classified: 'As yet unclassified'


D1Stroke understands: 'pathLength: t1 | t2 t3 t4 t5 
	[t3 _ 0.0.
	t4 _ t1  1.
	for t2 to: t1 length do
	 [t2 > 1 
	 [t5 _ t1  t2.
	 t3 _ t3 + (self dist: t4 and: t5).
	 t4 _ t5]].
	t3]' classified: 'As yet unclassified'


D1Stroke understands: 'preProcess | t1 i
	[points _ self resample: points with: 64.
	points _ self translate: points to: 0  0.
	t1 _ self indicativeAngle: points.
	points _ self rotate: points by: t1.
	points _ self scale: points to: 250.0.
	user show: points asString.
	user cr]' classified: 'As yet unclassified'


D1Stroke understands: 'rotate: t1 by: t2 | t3 t4 t5 t6 t7 
	[t5 _ Vector new: t1 length.
	for t3 to: t1 length do
	 [t4 _ t1  t3.
	 t6 _ self dist: t4 and: (Point new x: 0.0 y: 0.0).
	 t7 _ t2 asFloat - (self theta: t4).
	 t5  t3 _ t6 * t7 cos  (0.0 - (t6 * t7 sin))].
	t5]' classified: 'As yet unclassified'


D1Stroke understands: 'scale: t1 to: t2 | t3 t4 t5 t6 
	[t3 _ (self encompassingRectangle: t1) extent.
	t5 _ Vector new: t1 length.
	for t4 to: t1 length do
	 [t6 _ t1  t4.
	 t5  t4 _ t6 x * t2 asFloat / t3 x asFloat  (t6 y * t2 asFloat / t3 y asFloat)].
	t5]' classified: 'As yet unclassified'


D1Stroke understands: 'theta: t1 | t2 t3 t4 t5 
	[t2 _ t1 x.
	t3 _ t1 y.
	[t2 = 0 
	 [t3  0  [1.5707963]
	 true  [4.712389]]].
	t5 _ t3 asFloat / t2 asFloat.
	t4 _ self arctan: t5.
	[t2  0 
	 [t3  0  [t4]
	 true  [ 6.2831853 + t4]]].
	true  [ 3.1415927 + t4]]' classified: 'As yet unclassified'


D1Stroke understands: 'name: t1 
	[name _ t1]' classified: 'As yet unclassified'


D1Stroke understands: 'points: t1 
	[points _ t1]' classified: 'As yet unclassified'


D1Stroke understands: 'points [points]' classified: 'As yet unclassified'


D1Stroke understands: 'arctan: t1 | t2 
	[t2 _ t1 arctan.
	t2 / 360.0 * 6.2831853]' classified: 'As yet unclassified'


D1Stroke understands: 'lerp: a to: b at: ratio | aa bb "short comment"
	[aa _ Point new x: a x asFloat y: a y asFloat.
	bb _ Point new x: b x asFloat y: b y asFloat.
	 aa + ((bb - aa) * ratio)]' classified: 'As yet unclassified'


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


