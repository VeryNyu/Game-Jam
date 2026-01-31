extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and body.get_node("AnimatedSprite2D").animation == "Bear":
		$Timer.start()
		hide()
		$CollisionShape2D.set_deferred("disabled", true)
		$RigidBody2D/CollisionShape2D.set_deferred("disabled", true)


func _on_timer_timeout() -> void:
	$CollisionShape2D.set_deferred("disabled", false)
	$RigidBody2D/CollisionShape2D.set_deferred("disabled", false)
	show()
