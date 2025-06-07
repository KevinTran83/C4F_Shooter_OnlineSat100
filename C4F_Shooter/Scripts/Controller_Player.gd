extends Node

@onready var shooter : Shooter = get_parent()

func _process(delta: float) -> void:
    if Input.is_action_just_pressed("Jump") : shooter.Jump()

    var dir_x : float = 0
    if Input.is_action_pressed("MoveRight") : dir_x += 1
    if Input.is_action_pressed("MoveLeft" ) : dir_x -= 1
    
    var dir_z : float = 0
    if Input.is_action_pressed("MoveForward" ) : dir_z += 1
    if Input.is_action_pressed("MoveBackward") : dir_z -= 1
