class_name Shooter
extends CharacterBody3D

@export var moveSpeed : float = 2
@export var jumpSpeed : float = 5

@export var lookSpeed : float = 1
# TODO Max look x angle
@export var head : Node3D
@export var forwardVector : Node3D

@onready var gravity : float = ProjectSettings.get_setting("physics/3d/default_gravity")

var rayDown : RayCast3D
var currentSpeed : float
var dt : float

func _ready() -> void:
    
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    
    # Set properties for rayDown
    rayDown = RayCast3D.new()
    add_child(rayDown)
    rayDown.set_position(Vector3.DOWN)
    rayDown.set_target_position( Vector3(0, -.1, 0) )
    
    currentSpeed = 0

# Runs one or more times each frame
func _physics_process(delta: float) -> void:
    
    # Falling
    velocity.y -= gravity * delta
    
    move_and_slide()
    
    dt = delta

func Jump() -> void : if rayDown.is_colliding() : velocity.y = jumpSpeed

func Move(dir : Vector3) -> void :
    currentSpeed += moveSpeed / 100
    currentSpeed = clampf(currentSpeed, 0, moveSpeed)
    
    var vel_y : float = velocity.y
    
    velocity = dir * currentSpeed + Vector3.UP * vel_y

func Look(axis : Vector2) -> void:
    if not head or not forwardVector : return
    
    head.rotate_x( -deg_to_rad(axis.y * lookSpeed) * dt )
    #forwardVector.rotate_y( -deg_to_rad(axis.x * lookSpeed) * dt )
    rotate_y( -deg_to_rad(axis.x * lookSpeed) * dt )
