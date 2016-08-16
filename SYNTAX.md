Jasper Lang
-----------

A little language for programming the NES.

Goals
=====

1. Automate common module tasks that I perform when writing CA65 code.
2. Automate common debugging tasks I perform in FCEUX. 
3. Leverage CC65 toolchain.

Types
=====

Use stdint.h types when at all possible.

Modules
=======

For encapsulating functionality. Only one per file please.

```
module Physics
	# include public properties and methods of other modules
	include Common
	include Common::params

	# local variables, only visible inside module
	@var:uint8_t = 1
	$var:uint8_t = 2

	# Take advantage of CA65s .CONSTRUCTOR?
	def loaded():void
		# called when module is loaded?
	end

	# Take advantage of CA65s .DECONSTRUCTOR
	def finished():void
		# would this ever be called?
	end

	# Take advantage of CA65s .INTERUPPTOR?
	def interrupt_requested():void
	end

	# Take advantage of CA65s .INTERUPPTOR?
	def nonmaskable_interuppt_requested():void
	end

	# public is default
	public
	def update_solids(solid:uint8_t):void
	end

	def is_touching?(screen_x:uint8_t, screen_y:uint8_t):boolean
	end

	# private methods are not visible outside this module
	private
	def _is_touching(screen_x, screen_y)
	end
end
```

ASM
===

To drop into 6502 assembly simply:
```
asm do
	lda #01
	sta address
end
```
