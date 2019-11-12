extends RigidBody2D

export var maxspeed = 300
var _decay_rate = 1.5
var _start_size
var _start_position
var _trauma = 0.0
var _rotation = 0
var _rotation_speed = 0.05
var _max_offset = 6




signal lives
signal score

func _ready():
 get_node("ColorRect")
 contact_monitor = true
 set_max_contacts_reported(4)
 var WorldNode = get_node("/root/World")
 connect("score", WorldNode, "increase_score")
 connect("lives", WorldNode, "decrease_lives")
 _start_position = $ColorRect.rect_position

func _process(delta):
	if _trauma > 0:
		_decay_trauma(delta)
		_apply_shake()

func _physics_process(delta):
 var bodies = get_colliding_bodies()
 for body in bodies:
  if body.is_in_group("Tiles"):
   emit_signal("score",body.score)
   body.queue_free()
  add_trauma(2.0)
  if body.get_name() == "Paddle":
   pass

 if position.y > get_viewport_rect().end.y:
  emit_signal("lives")
  queue_free()

func add_trauma(amount):
	_trauma = min(_trauma + amount, 1)

func _decay_trauma(delta):
	var change = _decay_rate * delta
	_trauma = max(_trauma - change, 0)
	
func _get_neg_or_pos_scalar():
	return rand_range(-1.0, 1.0)
	
func _apply_shake():
	var shake = _trauma * _trauma
	var o_x = _max_offset * shake * _get_neg_or_pos_scalar()
	var o_y = _max_offset * shake * _get_neg_or_pos_scalar()
	$ColorRect.rect_position = _start_position + Vector2(o_x, o_y)


	
