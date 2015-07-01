module FixtureHelper
  def correios_fixture(filename)
    File.open("./spec/fixtures/correios/#{filename}")
  end

  def builders_fixture(filename)
    File.read("./spec/fixtures/builders/#{filename}")
  end

  def request_fixture(filename)
    File.read("./spec/fixtures/requests/#{filename}")
  end
end
