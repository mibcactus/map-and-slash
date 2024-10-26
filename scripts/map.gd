extends Node2D

var lat = 52.939390
var lon = -1.147170

@export var mult = 0.005

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

var polygons: Array = []

func latCalc(tempLat: float) -> float:
	var x = tempLat - minLat
	return (x/latRange) * 1000
	
func lonCalc(tempLon: float) -> float:
	var x = tempLon - minLon
	return (x/lonRange) * 1000
		
	

# Called when the node enters the scene tree for the first time.
func a_ready() -> void:
	var headers = ["Content-Type: application/json"]
	
	var response = await $HTTPRequest.request_completed.connect(a_on_request_completed)
	var body = """data=
	[bbox:{b1},{b2},{b3},{b4}]
			[out:json]
			[timeout:90]
			;
			way({b1},{b2},{b3},{b4});
			out geom;
			""".format({"b1":b1,"b2":b2,"b3":b3,"b4":b4})
	$HTTPRequest.request("https://overpass-api.de/api/interpreter", headers, HTTPClient.METHOD_POST, body)
	
	print("response is ", response)
		

func a_on_request_completed(result, _response_code, _headers, body):
	print(result)
	print("Response received")
	var json = JSON.parse_string(body.get_string_from_utf8())
	var _buildings: Array = []
	for element in json["elements"]:
		if element.has("tags"):
			if element["tags"].has("building"):
				print("BUILDING")
				var polygon = PackedVector2Array([])
				
				for point in element["geometry"]:
					if point.has("lat") and point.has("lon"):
						polygon.append(Vector2(latCalc(point["lat"]),lonCalc(point["lon"])))
						#print("Adding point "+str(latCalc(point["lat"]))+", "+str(lonCalc(point["lon"])))
					else:
						print("point has not been appended")
				
				polygons.append(polygon)
				#var newBuilding = Building.new()
				#newBuilding.updateCollision(polygon)
				
				#buildings.append(newBuilding)
				
				#newBuilding.queue_redraw()
				
				
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
