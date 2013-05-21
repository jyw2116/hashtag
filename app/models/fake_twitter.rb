class FakeTwitter
	def self.[]=(term, results)
		@data ||= {}
		@data[term] = results
	end

	def self.search(term)
		# results = @data[term].map {|hash| Twitter::Status.new(hash.merge(id: 1)) }
		
		puts @data[term].inspect
		results = @data[term].map do |hash|
			puts hash.inspect
			hash_with_id = hash.merge(id: 1)
			puts hash_with_id.inspect
			Twitter::Status.new(hash_with_id)
		end

		OpenStruct.new(results: results)
	end
end