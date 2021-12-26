require "thor"
require "tty-prompt"
require "tty-spinner"

module Autocircle
  class CLI < Thor
    desc "generate", "Generate Circle CI configuration"
    def generate
      prompt = TTY::Prompt.new
      generator = Autocircle::Generator.new
      input = {}
      input[:main_lang] = prompt.select("? Select main language:", generator.options.languages)

      spinner = TTY::Spinner.new("[:spinner] Loading #{input[:main_lang]} versions ...", format: :pulse_2)
      spinner.auto_spin
      versions = generator.options.versions(input[:main_lang])
      spinner.stop("Done!")

      input[:main_lang_version] = prompt.select("? What #{input[:main_lang]} version?:", versions)
      input[:variants] = prompt.multi_select("? Do you use variant?:", generator.options.variants[input[:main_lang]])

      if prompt.yes?("? Do you use SQL?")
        input[:sql] = prompt.select("? Select SQL:", generator.options.sqls)

        spinner = TTY::Spinner.new("[:spinner] Loading #{input[:sql]} versions ...", format: :pulse_2)
        spinner.auto_spin
        versions = generator.options.versions(input[:sql])
        spinner.stop("Done!")

        input[:sql_version] = prompt.select("? What #{input[:sql]} version?:", versions)
      end

      if prompt.yes?("? Do you do browser test?")
        input[:browser] = prompt.select("? Select browser:", generator.options.browsers)
      end
      input[:default_branch] = prompt.ask("? Default branch:", default: generator.options::BRANCH_DEFAULT)

      spinner = TTY::Spinner.new("[:spinner] Writing ./circleci/config.yml ...", format: :pulse_2)
      spinner.auto_spin
      generator.call(input)
      spinner.stop("Done!")
      puts "✔︎ .circleci/config.yml is generated!"
    end
  end
end
