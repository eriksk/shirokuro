module SK
	class MapComponent < Component
		
		attr_accessor :map

		def initialize map
			@map = map
		end
	end
end