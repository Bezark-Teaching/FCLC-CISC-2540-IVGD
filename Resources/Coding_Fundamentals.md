So far we have looked at nodes and scenes in Godot. These are a lot like nouns: they are object and things in our environment.

With coding we begin to use **verbs**. We learn how to make these nouns do things.

### Coding Basic Interactions
- Code is written in Scripts
- Code always excecutes from top to bottom

```
I happen first
I happen second
```
#### Variables
Variables hold a value in memory. Just like math class.
You can always:
- make new variables.
- retrive the contents of a variable.
- change the contents of a variable.

```gdscript
var x = 1
x = x + 1
print(x)

#will print out "2"
```
#### Functions
- If Nodes are nouns, functions are verbs
  - they *do* things.
- Functions are sort of like factories or pizza restaurants.
  - They need instructions.
```gdscript
func make_a_pizza() -> pizza:
	make dough
	spin it around in the air for fun
	add sauce
	add cheese
	cook it
  return pizza
```

Things that are **indented** are considered part of the function or the block.

```gdscript
func my_function():
  this stuff is part of this function
  this stuff is also part of this function

this stuff is not
```

The `( )` is used for adding arguments
like extra instructions
```gdscript
func make_a_pizza(toppings):
	make dough
	spin it around in the air for fun
	add sauce
	add cheese
  add topping
	cook it

make_a_pizza(peperoni)
make_a_pizza(mushrooms)

```

You can make your own functions, or use functions built in to your environment.

### Coding in Godot
- In Godot we use a language called gd-script.
  - This is custom made for godot, but is very similar to python.
- Scripts are attached to nodes.
- There are 2 fundamental functions that all nodes have.
  - _ready()
    - executes when the node is loaded into the scene for the first time
  - _process()
    - executes once every frame.
- The `->thing` is optional

Nodes have properties and methods.

#### Properties
  - If Nodes are nouns, then properties are adjectives
  - Properties are the same ones in the inspector
#### Methods
- Methods (functions) are special verbs/abilities
Let's look at a simple example!
  - Set position
  - `hide()` &`show()`
