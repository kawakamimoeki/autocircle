require "dry/schema"

module Autocircle
  Configuration = Dry::Schema.Params do
    required(:version).filled(:string)
    optional(:orbs).maybe(:hash)
    required(:jobs).hash do
      required(:build).hash do
        optional(:docker).array(:hash) do
          required(:image).filled(:string)
        end
        required(:steps).filled(:array)
      end
    end
    required(:workflows).hash do
      required(:build).hash do
        required(:jobs).array(:hash) do
          required(:build).hash do
            required(:filters).hash do
              required(:branches).hash do
                required(:only).array(:string)
              end
            end
          end
        end
      end
    end
  end
end
