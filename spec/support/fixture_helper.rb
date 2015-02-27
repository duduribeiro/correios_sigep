module FixtureHelper
  def correios_fixture(filename)
    File.open("./spec/fixtures/correios/#{filename}")
  end
end
