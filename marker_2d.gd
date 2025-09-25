extends Marker2D

@onready var spawn_point = [$spawn, $spawn2, $spawn3, $spawn4, $spawn5]
@onready var npc_anim = $npc
@onready var player = get_node("../helico")
var current_person = null
var current_spawn_point = null

func _ready():
	npc_anim.visible = false
	spawn_person()

func _process(delta):
	if not(player == null):
		person_picked()

func spawn_person():
	if current_person == null:
		current_spawn_point = spawn_point[randi() % spawn_point.size()]
		create_person(current_spawn_point.global_position)
		
func create_person(position):
	npc_anim.global_position = position
	npc_anim.visible = true
	npc_anim.get_node("npc_anim").play("default")
	current_person = npc_anim
	
func person_picked():
	var distance = player.global_position.distance_to(npc_anim.global_position)
	
	if distance <= 33:
		npc_anim.visible = false
		current_person = null
		spawn_person()
