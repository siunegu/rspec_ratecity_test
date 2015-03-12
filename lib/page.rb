require 'pry'
require 'json'

Page = Struct.new(:name, :content) do 
	def self.from_map(map)
		map_name = map['name'] 
		map_content = map['content'] 

		self.new(map_name, map_content)
	end

	def self.ingest(json)						
		json_object = JSON.parse(json)
		
			array = []
	
			json_object.each do |x|		
				binding.pry
				if x.include?('links')
					array << self.new(x['name'], x['content']) 			
				else
					self.from_map(name: x['links'][0])
					self.from_map(name: x['links'][1])
				end
			end

		array

	end
end
