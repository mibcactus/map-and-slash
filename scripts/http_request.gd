extends HTTPRequest

# player's location
var lat = 52.939390
var lon = -1.147170

# zoom scale

@export var map_scale = 3000

var map_range = 1.0/map_scale

var minLat = lat - map_range
var minLon = lon - map_range

var maxLat = lat + map_range
var maxLon = lon + map_range

var latRange = maxLat-minLat
var lonRange = maxLon-minLon

var polygons: Array = []

func latCalc(tempLat: float) -> float:
	var x = tempLat - minLat
	return (x/latRange) * 1000
	
func lonCalc(tempLon: float) -> float:
	var x = tempLon - minLon
	return (x/lonRange) * 1000

# Called when the node enters the scene tree for the first time.
		

func _on_request_completed(result, _response_code, _headers, body):
	print("result: ", result)
	print("response code: ", _response_code)
	print("Response received")
	
	var bodystring = body.get_string_from_utf8()
	print("body string: ")
	print(bodystring)
	var json = JSON.parse_string(bodystring)
	var _buildings: Array = []
	
	var buildingsNode = find_child("Building")
	
	for element in json["elements"]:
		if element.has("tags"):
			if element["tags"].has("building"):
				var polygon = PackedVector2Array([])
				
				for point in element["geometry"]:
					if point.has("lat") and point.has("lon"):
						polygon.append(Vector2(latCalc(point["lat"]),lonCalc(point["lon"])))
						print("Adding point "+str(latCalc(point["lat"]))+", "+str(lonCalc(point["lon"])))
					else:
						print("point has not been appended")
				
				var collisionObject = CollisionPolygon2D.new()
				collisionObject.polygon = polygon;
				buildingsNode.add_child(collisionObject)

func _ready() -> void:
	var headers = ["Content-Type: application/json"]
	
	#$HTTPRequest.request_completed.connect(_on_request_completed)
	var body = """data=
	[bbox:{b1},{b2},{b3},{b4}]
			[out:json]
			[timeout:90]
			;
			way({b1},{b2},{b3},{b4});
			out geom;
			""".format({"b1":minLat,"b2":minLon,"b3":maxLat,"b4":maxLon})
	request("https://overpass-api.de/api/interpreter", headers, HTTPClient.METHOD_POST, body)
	
