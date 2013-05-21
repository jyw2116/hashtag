class FakeTwitter
	def self.[]=(term, results)
		@data ||= {}
		@data[term] = results
	end

	def self.search(term)
		# results = @data[term].map {|hash| Twitter::Status.new(hash.merge(id: 1)) }
		@data ||= {}	
		results = @data.fetch(term, []).map do |hash|
			hash_with_id = hash.merge(id: 1)
			Twitter::Status.new(hash_with_id)
		end

		OpenStruct.new(results: results)
	end

	def self.clear
		@data = {}
	end
end