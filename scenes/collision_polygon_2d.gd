extends CollisionPolygon2D
var v1 = Vector2(586.35101386699, 165.916995737344)
var v2 = Vector2(586.430916563257, 189.113209027435)
var v3 = Vector2(586.396537625382, 189.810577333789)
var v4 = Vector2(586.422794066944, 197.411891873052)
var v5 = Vector2(586.337035617522, 199.146595535095)
var v6 = Vector2(586.361592001711, 206.294620675234)
var v7 = Vector2(586.394459777491, 205.632120784198)
var v8 = Vector2(586.401826692742, 207.785245430065)
var v9 = Vector2(586.333257712257, 209.17126493894)
var v10 = Vector2(586.299823250695, 199.469128376797)
var v11 = Vector2(586.229743108101, 179.105973831259)
var v12 = Vector2(586.248065948617, 178.739855470422)
var v13 = Vector2(586.213309220211, 168.62801502829)
var v14 = Vector2(586.205186723899, 166.291831201996)
var v15 = Vector2(586.255999549664, 165.271930053957)
var v16 = Vector2(586.264499836507, 167.669133607055)
var v17 = Vector2(586.35101386699, 165.916995737344)
var test = PackedVector2Array([v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,v17])
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	polygon = test
