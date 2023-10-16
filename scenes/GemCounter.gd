extends RichTextLabel

var gems_collected = 0

func _ready():
#	print("gems collected", gems_collected)
	text = String(gems_collected)


func _on_gem_collected():
	gems_collected = gems_collected + 1
	print("gems newly colected", gems_collected)
	_ready()
