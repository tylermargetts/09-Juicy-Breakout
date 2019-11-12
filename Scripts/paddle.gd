extends KinematicBody2D

var _target = position

var new_ball = preload("res://Scenes/Ball.tscn")

func _ready():
 set_process_input(true)
 position.y = -30
 $Tween.interpolate_property(self, "position", position, _target, 1.0, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
 $Tween.start()

func _physics_process(delta):
 var mouse_x = get_viewport().get_mouse_position().x
 position = Vector2(mouse_x, position.y)

func _input(event):
 if event is InputEventMouseButton and event.pressed:
  if not get_parent().has_node("Ball"):
   var ball = new_ball.instance()
   ball.position = Vector2(100, 200)
   ball.name = "Ball"
   ball.linear_velocity = Vector2(200, -200)
   get_parent().add_child(ball)