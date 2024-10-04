class TestJob < ApplicationJob
  def perform(*args)
    p "[#{Time.now}] Test Job Starts"
    p 'Arguments'
    p args
    p "[#{Time.now}] Test Job Ends"
  end
end