require_relative '../skipbeat'

class SkipBeat::Door
	attr_reader :is_open, :is_locked, :inscription
	def initialize(is_open=false,is_locked=true,inscription)
		@is_open=is_open
		@is_locked=is_locked
		@inscription=inscription
	end

	def unlock
		if is_locked
			@is_locked=false 
		else
			raise "This door is already unlocked"
		end
	end

	def open
		unless is_open 
			unless is_locked
				@is_open=true
			else
				raise "The door is locked"
			end
		else
			raise "This door is already open"
		end
	end	

	def close
		if is_open
			@is_open=false
		else
			raise "This door is already closed"
		end
	end

	def lock
		unless is_locked
			@is_locked=true
		else
			raise "This door is already locked"
		end
	end

	def inscription
		return "There is no inscription on this door" if @inscription==""
		return @inscription
	end
end