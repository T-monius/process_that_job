require_relative 'jobify/active_job_adapter.rb'

class Jobify
  def initialize; end

  def start
    self.running = true
    puts "Starting jobify"
    puts '---------------------'

    sleep(1)
    while running
      # check queue for jobs and process them
      puts 'processing those jobs'
      sleep(5)
    end
  rescue SystemExit, Interrupt
    puts "\nShutting down"
    sleep(1)
    shutdown

    exit
  end

  def shutdown
    self.running = false
  end

  protected

  attr_accessor :running
end

job_processor = Jobify.new

job_processor.start
