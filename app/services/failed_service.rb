class FailedService < StandardError
  attr_reader :payload

  def initialize(payload)
    super

    @payload = payload
  end
end