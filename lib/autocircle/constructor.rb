module Autocircle
  class Constructor
    class InputError < RuntimeError; end

    attr_reader :config

    def initialize(default = DEFAULT_CONFIGURATION)
      @config = default
    end

    def call(input)
      input = Input.call(input)
      raise InputError, input.errors.to_h if input.errors.to_h != {}

      @input = input.to_h

      set_docker_image
      use_sql if use_sql?
      use_browser if use_browser?
      use_ruby if use_ruby?
      use_node if use_node?
      set_main_branch
    end

    def set_main_branch
      @config['workflows']['build']['jobs'][0]['build']['filters']['branches']['only'] << @input[:default_branch]
    end

    def use_sql?
      @input[:sql]
    end

    def use_browser?
      @input[:browser]
    end

    def use_ruby?
      @input[:main_lang] == 'ruby'
    end

    def use_node?
      @input[:main_lang] == 'node' || @input[:variants].include?('node')
    end

    def use_browser
      @config['orbs']['browser-tools'] = Orb.new('browser-tools').stanza
      @config['jobs']['build']['steps'] << "browser-tool/install-#{@input[:browser]}"
    end

    def use_sql
      @config['jobs']['build']['docker'] << {
        'image' => DockerImage.new(@input[:sql]).stanza(@input[:sql_version])
      }
    end

    def use_ruby
      @config['orbs']['ruby'] = Orb.new('ruby').stanza
      @config['jobs']['build']['steps'] << "ruby/install-deps"
    end

    def use_node
      @config['orbs']['node'] = Orb.new('node').stanza
      @config['jobs']['build']['steps'] << { "node/install-packages" => { "pkg-manager" => "yarn" } }
    end

    def set_docker_image
      @config['jobs']['build']['docker'] << {
        'image' => DockerImage.new(@input[:main_lang]).stanza(@input[:main_lang_version], @input[:variants])
      }
    end
  end
end
