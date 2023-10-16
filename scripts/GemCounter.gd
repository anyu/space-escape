extends RichTextLabel

var gems_collected = 0

func _ready():
	text = str(gems_collected)

func _on_Gem_gem_collected():
	gems_collected += 1
	_ready()

