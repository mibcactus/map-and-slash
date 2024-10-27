extends HTTPRequest

# player's location
var lat = 52.939390
var lon = -1.147170

# zoom scale
@export var map_scale = 3000

@export var texture_filepath = "res://icon.svg"
var texture

var map_range = 1.0/map_scale

var minLat = lat - map_range
var minLon = lon - map_range

var maxLat = lat + map_range
var maxLon = lon + map_range

var latRange = maxLat-minLat
var lonRange = maxLon-minLon

var polygons: Array = []

# north-south
func latCalc(responseLat: float) -> float:
	var x = responseLat - minLat
	return (x/latRange) * 1000 + maxLat

# east-west
func lonCalc(responseLon: float) -> float:
	var x = responseLon - minLon
	return (x/lonRange) * 1000 + maxLon

func _on_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	var _buildings: Array = []
	
	var buildingsNode = find_child("Building")
	
	for element in json["elements"]:
		if element.has("tags"):
			if element["tags"].has("building"):
				var polygon = PackedVector2Array([])
				
				for point in element["geometry"]:
					if point.has("lat") and point.has("lon"):
						polygon.append(Vector2(latCalc(point["lat"]),lonCalc(point["lon"])))
				
				var buildingCollision = CollisionPolygon2D.new();
				buildingCollision.polygon = polygon
				
				var building = Polygon2D.new()
				building.polygon = polygon
				building.texture = texture
				building.texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
				
				buildingsNode.add_child(buildingCollision)
				buildingsNode.add_child(building)
				
				

func _ready() -> void:
	var headers = ["Content-Type: application/json"]
	texture = load(texture_filepath)
	
	var body = """data=
	[bbox:{b1},{b2},{b3},{b4}]
			[out:json]
			[timeout:90]
			;
			way({b1},{b2},{b3},{b4});
			out geom;
			""".format({"b1":minLat,"b2":minLon,"b3":maxLat,"b4":maxLon})
	request("https://overpass-api.de/api/interpreter", headers, HTTPClient.METHOD_POST, body)
	
