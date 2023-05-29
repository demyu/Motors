class BaseService
  attr_accessor :failed, :errors

  def self.call(*args)
    instance = new(*args)
    instance.initialize_defaults
    instance.validate!
    instance.call
  rescue FailedService => e
    e.payload
  end

  def fail!(errors: [], message: nil, **fields)
    self.failed = true

    errors = errors.to_a << message

    payload = build_result(errors: errors, message: message, **fields)

    raise FailedService, payload
  end

  def success?
    !failed
  end

  def failure?
    failed
  end

  def build_result(errors: [], message: nil, **fields)
    self.errors += errors.to_a

    OpenStruct.new(
      success?: success?,
      failure?: failure?,
      errors: self.errors,
      message: message || self.errors.to_sentence,
      **fields
    )
  end

  def initialize_defaults
    self.failed = false
    self.errors = []
  end
end
