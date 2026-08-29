extends CharacterBody2D

@export var speed: float = 100.0
var player: Node2D = null

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		
		# (Optional) Flip the label horizontally using scale
		if direction.x != 0:
			$Label.scale.x = -1 if direction.x < 0 else 1
		
		move_and_slide()
