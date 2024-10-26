extends Node2D

var lat = 52.939390
var lon = -1.147170

const mult = 0.005
var b1 = lat - (lat*mult)
var b2 = lon + (lon*mult)
var b3 = lat + (lat*mult)
var b4 = lon - (lon*mult)
var minLat = b1
var minLon = b2
var maxLat = b3
var maxLon = b4
var latRange = maxLat-minLat
var lonRange = maxLon-minLon

func latCalc(lat: float) -> float:
	var x = lat - minLat
	return (x/latRange) * 1000
	
func lonCalc(lon: float) -> float:
	var x = lon - minLon
	return (x/lonRange) * 1000
		
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	var headers = ["Content-Type: application/json"]
	
	$HTTPRequest.request_completed.connect(_on_request_completed)
	var body = """data=
	[bbox:{b1},{b2},{b3},{b4}]
			[out:json]
			[timeout:90]
			;
			way({b1},{b2},{b3},{b4});
			out geom;
			""".format({"b1":b1,"b2":b2,"b3":b3,"b4":b4})
	$HTTPRequest.request("https://overpass-api.de/api/interpreter", headers, HTTPClient.METHOD_POST, body)

func _on_request_completed(result, response_code, headers, body):
	print("Response received")
	var json = JSON.parse_string(body.get_string_from_utf8())
	var buildings: Array = []
	for element in json["elements"]:
		if element.has("tags"):
			if element["tags"].has("building"):
				print("BUILDING")
				var polygon = PackedVector2Array([])
				
				for point in element["geometry"]:
					if point.has("lat") and point.has("lon"):
						var lat = point["lat"]
						var long = point["lon"]
						polygon.append(Vector2(latCalc(point["lat"]),lonCalc(point["lon"])))
						print("Adding point "+str(latCalc(point["lat"]))+", "+str(lonCalc(point["lon"])))
					else:
						print(point)
				
				var newBuilding = Building.new()
				newBuilding.updateCollision(polygon)
				
				buildings.append(newBuilding)
				
				newBuilding.queue_redraw()
				
				
				
				
				
				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
