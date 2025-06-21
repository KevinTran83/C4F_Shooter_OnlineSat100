class_name Firearm
extends Node3D

@export var muzzle     : Node3D
@export var rpm        : float = 300
@export var projectile : PackedScene

var timer : Timer

func _ready() -> void:
    timer = Timer.new()
    add_child(timer)
    timer.one_shot = true
    timer.timeout.connect(SpawnBullet)

func PullTrigger() -> void:
    if timer.is_stopped(): timer.start(60.0/rpm)

func SpawnBullet() -> void:
    var newProjectile : RigidBody3D = projectile.instantiate()
    get_tree().get_root().get_node("Level").add_child(newProjectile)
    newProjectile.set_global_position(muzzle.get_global_position())
    newProjectile.apply_force(-muzzle.basis.z * 500)
    
