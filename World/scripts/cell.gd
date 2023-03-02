extends Area3D

## Cell scene for world building
##
## Cell scene, should represent every "block" in the map.[br]
## Walls will detect and test collision with other cells, "disabling" walls.[br]
## The collisionshape is what indicate players that they can move into the cell.[br] [br]
## TODO: [br]
## - Determine how to implement custom sprites, allowing easy swap [br]
## - Slopes and falls [br]
## [br]
## Sources.:[br]
## Heartbeast "3D Dungeon Code Walkthrough in Under 15 Minutes - Godot 3.4"[br]
## Godot's Docstring documentation
## @tutorial: https://www.youtube.com/watch?v=6yqObNCkiiY
## @tutorial: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html
class_name Cell

@onready var floor_tile: MeshInstance3D = $FloorTile
@onready var roof_tile: MeshInstance3D = $RoofTile
@onready var west_tile: MeshInstance3D = $WestTile
@onready var east_tile: MeshInstance3D = $EastTile
@onready var north_tile: MeshInstance3D = $NorthTile
@onready var south_tile: MeshInstance3D = $SouthTile

## Copied from heartbeast code, it verifies if there's a cell nearby towards the direction. 
## If positive, walls are removed.
func update_faces(cell_list) -> void:
	var my_grid_position = Vector2i(position.x/GlobalVariables.GRID_SIZE, position.z/2)
	if cell_list.has(my_grid_position + Vector2i.RIGHT):
		east_tile.queue_free()
	if cell_list.has(my_grid_position + Vector2i.LEFT):
		west_tile.queue_free()
	if cell_list.has(my_grid_position + Vector2i.DOWN):
		south_tile.queue_free()
	if cell_list.has(my_grid_position + Vector2i.UP):
		north_tile.queue_free()
