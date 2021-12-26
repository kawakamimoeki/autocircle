require "yaml"

module Autocircle
  class ConfigFile
    DIR = ".circleci"
    FILENAME = "config.yml"

    #
    # @return [void]
    #
    def create!(config)
      Dir.mkdir(DIR) unless Dir.exist?(DIR)
      File.open("#{DIR}/#{FILENAME}", "w+") do |f|
        f.write(YAML.dump(config, header: false, indentation: 1))
      end
    end
  end
end
