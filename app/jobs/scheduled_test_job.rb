class ScheduledTestJob < ApplicationJob
  def perform(cancel = false)
    p "[#{Time.now}] Scheduled Test Job Starts"
    p "The job will run at #{Time.now + 3.minutes}" unless cancel
    p 'the job will not run' if cancel
    job = TestJob.set(wait_until: (Time.now + 3.minutes)).perform_later("This was scheduled at #{Time.now}")

    SolidQueue::Job.find(job.provider_job_id).destroy if cancel
    p "[#{Time.now}] Scheduled Test Job Ends"
  end
end