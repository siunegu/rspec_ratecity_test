require 'pry'
require 'json'

Page = Struct.new(:name, :content) do 
	def self.from_map(map)
		# implement from_map to pass the specifications found in page_spec.rb
		map_name = map['name'] 
		map_content = map['content'] 
		self.new(map_name, map_content)
	end

	def self.ingest(json)						
		json_object = JSON.parse(json)
		array = []
		json_object.each do |x|		

			array << self.new(x['name'], x['content']) 			
		end
		array
	end
end
