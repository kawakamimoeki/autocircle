require "docker_registry2"

module Autocircle
  class DockerImage
    NAMESPACE = "cimg"

    def initialize(
      name,
      registry = DockerRegistry2.connect
    )
      @name = name
      @registry = registry
    end

    def stanza(version, variants = [])
      "#{NAMESPACE}/#{@name}:#{version}#{variants.map { |v| "-#{v}" }.join}"
    end

    def tags
      @registry.tags("#{NAMESPACE}/#{@name}")["tags"]
    end

    def versions
      tags.select { |t| t.match(/^[0-9]+\.[0-9]+(\.[0-9]+)*$/) }
    end
  end
end
