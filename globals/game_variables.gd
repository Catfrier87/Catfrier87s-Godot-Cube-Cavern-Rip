extends Node

var player_body: RigidBody3D = null
signal player_loaded

var in_dungeon: bool = false
var dungeon_id: String = "Lobby"
var dungeon_seed: int = 0
