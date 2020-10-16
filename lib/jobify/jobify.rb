# require_relative '/queue.rb'

class Jobify
  def initialize(queue)
    self.queue = queue
  end

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

  attr_accessor :queue, :running
end

tmp_queue = []
job_processor = Jobify.new(tmp_queue)

job_processor.start
