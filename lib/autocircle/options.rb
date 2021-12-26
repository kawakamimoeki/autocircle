module Autocircle
  class Options

    BRANCH_DEFAULT = "main"

    class << self
      #
      # @return [Array]
      #
      def versions(image_name)
        DockerImage.new(image_name).versions.sort.reverse
      end

      #
      # @return [Array]
      #
      def languages
        ['ruby', 'node']
      end

      #
      # @return [Hash]
      #
      def variants
        {
          'ruby' => ['node', 'browser'],
          'node' => ['browser']
        }
      end

      #
      # @return [Array]
      #
      def sqls
        ['postgres', 'mysql']
      end

      #
      # @return [Array]
      #
      def browsers
        ['chrome', 'firefox', 'safari']
      end
    end
  end
end
