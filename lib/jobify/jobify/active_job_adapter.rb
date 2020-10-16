require 'active_job'

module ActiveJob
  module QueueAdapters
    class JobifyAdapter
      def enqueue(job, attributes = {})
      end

      def enqueue_at(job, timestamp)
        enqueue(job, timestamp: timestamp)
      end
    end
  end
end
