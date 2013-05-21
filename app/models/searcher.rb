class Searcher
	def initialize(term)
		@term = term
	end

	def each(&block)
		@tweets = Twitter.search(@term).results.each(&block)
	end
end