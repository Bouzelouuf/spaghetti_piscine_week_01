extends CharacterBody2D

@onready var spawn_manager = get_node("../SpawnContainer")
@onready var sprite = $helico_animated2d_sprite
var min_speed = 300
var acceleration_timer = 0.0

func _physics_process(delta):
	var direction_x = Input.get_axis("ui_left","ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	acceleration_timer += delta
	var speed = min_speed * acceleration_timer 
	velocity.x = direction_x * speed;
	velocity.y = direction_y * speed;
	if direction_x > 0:
		sprite.play("right")
		sprite.flip_h = false
	elif direction_x < 0:
		sprite.play("right")
		sprite.flip_h = true
	elif direction_y > 0 || direction_y < 0:
		sprite.play("idle")
		sprite.flip_h = false
	else:
		sprite.play("idle")
		acceleration_timer = 0
	move_and_slide()
