require 'dry/schema'

module Autocircle
  Input = Dry::Schema.Params do
    required(:main_lang).filled(:str?)
    required(:main_lang_version).filled(:str?)
    required(:variants).array(:str?)
    required(:sql).filled(:str?)
    required(:sql_version).filled(:str?)
    required(:browser).filled(:str?)
    required(:default_branch).filled(:str?)
  end
end
