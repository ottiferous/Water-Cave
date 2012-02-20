#####################
#			Function
# for water flowing
# in the damn cave.
#
#####################

class Cave
	
	def	initialize(height = 30, width = 30)
		@cave_map = []
		@last_water = []
	end

	def loadcave
		file = File.open('simple_cave.txt', 'r')
		max_water_volume = file.gets.to_i
	  file.each do |line|	
			@cave_map << line.rstrip.split(//)
		end
		@cave_map.shift
		[@cave_map[0].size, @cave_map.size, max_water_volume]
	end

	def display
		@cave_map.each do |a|
			a.each do |i|
				print i
			end
			print "\n"
		end
	end

	def col
		@cave_map[0].length - 1
	end

	def row
		@cave_map.length - 1
	end

	def flow

		self.row.downto(0) do |row|
			self.col.downto(0) do |col|
				
				if @cave_map[row][col] == "~"
					if @cave_map[row+1][col] == " "
						@cave_map[row+1][col] = "~"
						return
					elsif @cave_map[row][col+1] == " "
						@cave_map[row][col+1] = "~"
						return
					end
				end
			end
		end
	end

end

tickout = 0
cave = Cave.new
width,height,max_water = cave.loadcave

while (tickout < max_water)
	sleep(0.08)
	system("clear")
	puts "#{tickout}th Iteration on a[#{cave.row}x#{cave.col}] cave"
	cave.display
	cave.flow
	tickout += 1
end
