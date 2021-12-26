require 'octokit'

module Autocircle
  class Orb
    NAMESPACE = "circleci"
    ORGANIZATION = "CircleCI-Public"

    def initialize(name, client = Octokit::Client.new)
      @name = name
      @client = client
    end

    def tags
      @client.tags("#{ORGANIZATION}/#{@name}-orb").map { |t| t[:name] }
    end

    def latest_tag
      tags.first
    end

    def stanza(tag = latest_tag)
      "#{NAMESPACE}/#{@name}@#{version(tag)}"
    end

    def version(tag)
      tag.match(/[0-9]+\.[0-9]+\.[0-9]+/)[0]
    end
  end
end
