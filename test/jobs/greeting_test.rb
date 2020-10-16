require 'test_helper'

class GreetingTest < ActiveJob::TestCase
  test 'Can enqueue jobs' do
    assert_enqueued_jobs 0

    Greeting.perform_later('Hi!')

    assert_enqueued_jobs 1

    Greeting.perform_later('Olá')

    assert_enqueued_jobs 2
  end

  test 'Can enqueue jobs to be performed at a deffered time' do
    Greeting.set(wait_until: Date.tomorrow.noon).perform_later('Olá')

    assert_enqueued_with(job: Greeting, at: Date.tomorrow.noon)
  end

  test 'Can perform jobs' do
    Greeting.perform_later('Hi!')
    Greeting.perform_later('Olá')

    assert_enqueued_jobs 2

    perform_enqueued_jobs

    assert_performed_jobs 2
  end
end
