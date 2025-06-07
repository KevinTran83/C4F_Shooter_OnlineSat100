class_name Shooter
extends CharacterBody3D

@export var moveSpeed : float = 2
@export var jumpSpeed : float = 5

@onready var gravity : float = ProjectSettings.get_setting("physics/3d/default_gravity")

var rayDown : RayCast3D

func _ready() -> void:
    
    # Set properties for rayDown
    rayDown = RayCast3D.new()
    add_child(rayDown)
    rayDown.set_position(Vector3.DOWN)
    rayDown.set_target_position( Vector3(0, -.1, 0) )

# Runs one or more times each frame
func _physics_process(delta: float) -> void:
    
    # Falling
    velocity.y -= gravity * delta
    
    move_and_slide()

func Jump() -> void : if rayDown.is_colliding() : velocity.y = jumpSpeed

func Move(dir : Vector3) -> void : velocity = dir * moveSpeed
