module Autocircle
  class Generator
    attr_reader :options

    def initialize(
      options = Options,
      constructor = Constructor.new,
      file = ConfigFile.new
    )
      @options = options
      @constructor = constructor
      @file = file
    end

    def call(input)
      @constructor.call(input)
      @file.create!(@constructor.config)
    end
  end
end
