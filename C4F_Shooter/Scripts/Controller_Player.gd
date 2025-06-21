extends Node

@onready var shooter : Shooter = get_parent()

var playerSettings : PlayerSettings

func _ready() -> void:
    playerSettings = get_tree().get_root().get_node("Level").get_node("PlayerSettings")

func _process(delta: float) -> void:
    if Input.is_action_just_pressed("Jump") : shooter.Jump()

    var dir_x : float = 0
    if Input.is_action_pressed("MoveRight") : dir_x += 1
    if Input.is_action_pressed("MoveLeft" ) : dir_x -= 1
    
    var dir_z : float = 0
    if Input.is_action_pressed("MoveForward" ) : dir_z -= 1
    if Input.is_action_pressed("MoveBackward") : dir_z += 1
    
    shooter.Move(Vector3(dir_x, 0, dir_z).normalized())
    
    shooter.Look(Input.get_last_mouse_velocity() * playerSettings.GetSensitivity())
    
    if Input.is_action_pressed("Fire") : shooter.Shoot()
