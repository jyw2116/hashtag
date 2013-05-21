class Searcher
	class_attribute :backend
	self.backend = Twitter

	def initialize(term)
		@term = term
	end

	def each(&block)
		# class attributes allow setting attributes on a class level and on an instance level (below):
	backend.search(@term).results.each(&block)
	end
end

# this allows for something like :
# Searcher.backend = FakeTwitter 
