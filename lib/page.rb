require 'pry'

Page = Struct.new(:name, :content) do 
	def self.from_map(map)
		# implement from_map to pass the specifications found in page_spec.rb
		map_name = map['name'] 
		map_content = map['content'] 

		b = self.new(map_name, map_content)
		puts b
	end

	def self.ingest(json)		
		json.each do |x|
			a = self.new(x[:name], x[:content])
			puts a
			# binding.pry
		end
		# json.each do |json_record|
		# 	json_record
		# 	record_name = json_record[:name]
		# 	record_content = json_record[:content]			
		# 	a = self.new(record_name, record_content)
		# 	binding.pry
		# end
	end
end

json =  [
          {"name": "one", "content": "one content"},
          {"name": "two", "content": "two content"}
        ]
Page.ingest(json)


map = {'name' => 'Name',
       'content' => 'The content.'
      }
Page.from_map(map)