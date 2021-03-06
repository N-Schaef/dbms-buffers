# frozen_string_literal: true

module DbmsBuffers
  # The SimpleGenerator generates random elements for putting into the buffer.
  # By default, it generates a letter from A to Z.
  # This can be adjusted using the range method, e.g.
  # SimpleGenerator.new.range(['A', 'B', 'C'])
  class SimpleGenerator
    def initialize(seed = Random.new_seed)
      @rng = Random.new(seed)
      @range = *('A'..'Z')
    end

    def range(range)
      @range = range.to_a
      self
    end

    def get
      idx = @rng.rand(@range.size)
      @range[idx]
    end

    def repeat(amount)
      result = []
      amount.times { result << get }
      result
    end
  end
end
