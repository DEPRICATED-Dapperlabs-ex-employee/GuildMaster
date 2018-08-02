extends Panel

var cash = 0
var perclick = 1
var swords = 0
var swordcost = 20
var swordcostgrow = 4
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("ClickButton").connect("pressed", self, "_on_CashButton_pressed")
	get_node("SwordButton").connect("pressed", self, "_on_SwordButton_pressed")
	# Called when the node is added to the scene for the first time.
	# Initialization here

func _on_CashButton_pressed():
	cash = cash + (perclick + swords*2)

func _on_SwordButton_pressed():
	if cash >= 20:
		cash = cash - 20
		swords = swords + 1
		swordcost = swordcost + swordcostgrow
	else:
		print("Not enough Cash")

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	get_node("CashLabel").text = "Current Cash: "+ String(cash)
	get_node("SwordLabel").text = "Cost: " + String(swordcost)

