require 'pry'
require 'json'

Page = Struct.new(:name, :content) do 
	def self.from_map(map)
		map_name = map['name'] 
		map_content = map['content']	
			
		if !map.include?('links')
 	
			self.new(map_name, map_content)		
		else
			map_links = map['links'].map { |link| link }
			map_content = map.select {|hash_member| hash_member != 'name' && hash_member != 'links'}
exit

			self.new(map_name, map_links, map_content)	

		end

	end

	def self.ingest(json)						
		json_object = JSON.parse(json)
		
			array = []
					
				if json_object[0].include?('links')

					child1 = self.from_map('name' => json_object[0]['links'][0])
					child2 = self.from_map('name' => json_object[0]['links'][1])				
					array << self.from_map('name' => json_object[0]['name'], 'links'=> json_object[0]['links'])	
					binding.pry

					array << child1
					array << child2

				  array					 
				else
					json_object.each do |page_entry|
						array << self.new(page_entry['name'], page_entry['content']) 	
					end
				  array		
				end

	end
end
