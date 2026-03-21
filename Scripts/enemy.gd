extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

func _physics_process(_delta: float) -> void:
	if player_chase and player != null:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = direction.x < 0
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")

	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player = null
		player_chase = false
