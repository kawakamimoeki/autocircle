Dir.glob(__dir__ + "/autocircle/**/*.rb").each { |f| require_relative f }

module Autocircle
end

Autocircle::CLI.start
