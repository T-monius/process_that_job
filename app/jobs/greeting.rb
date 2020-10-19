class Greeting < ApplicationJob
  class BadJobError < ::StandardError; end
  # attach block for morgue queue?
  retry_on(BadJobError, wait: 5.minutes, attempts: 3)

  def perform(salutation)
    succeed = (0..10).to_a.sample > 1

    sleep(3)
    raise BadJobError unless succeed
    puts "\n#{salutation}"
  end
end
