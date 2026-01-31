extends Area2D

signal collect

var flag: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()
	flag = 0
	$Sprite2D.play("bear")
	position = Vector2(80, 400)
	scale = Vector2(0.1, 0.1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		collect.emit(flag)
		match flag:
			0:
				$Control/Timer.start()
				$Control/Label.text = "Spring brings a new, run strong run fast."
				$Control/Label.show()
				position = Vector2(450, 480)
				$Sprite2D.scale = Vector2(0.5, 0.5)
				$Sprite2D.play("fish")
			1:
				$Control/Timer.start()
				$Control/Label.text = "Meander through the changing currents of life."
				position = Vector2(1060, 740)
				$Sprite2D.play("eagle")
			2:
				hide()
				$Control/Timer.start()
				$Control/Label.text = "Move on freely to bring good blessings to all."
				$CollisionShape2D.set_deferred("disabled", true)
		flag += 1


func _on_timer_timeout() -> void:
	$Control/Label.text = ""
