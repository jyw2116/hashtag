class Searcher
	class_attribute :backend
	self.backend = Twitter

	def initialize(term)
		@term = term
	end

	def each(&block)
		# class attributes allow setting attributes on a class level and on an instance level (below):
		tweets.each(&block)
	end

	def length
		tweets.length
	end

	private

	def tweets
    @tweets ||= backend.search(@term).results
  end
end

# this allows for something like :
# Searcher.backend = FakeTwitter 
