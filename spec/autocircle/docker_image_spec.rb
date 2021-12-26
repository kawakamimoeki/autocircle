RSpec.describe Autocircle::DockerImage do
  class TestingDockerRegistry
    def tags(name)
      {
        "name" => name,
        "tags" => ['3.0.3', '3.0.3-node', 'v2.7.5']
      }
    end
  end

  describe "#versions" do
    it {
      image = Autocircle::DockerImage.new('ruby', TestingDockerRegistry.new)
      is_asserted_by { image.versions == ['3.0.3'] }
    }
  end
end

