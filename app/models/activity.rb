class Activity < OpenStruct

  def self.service
    @service ||= ActivityService.new
  end

  def self.user_activity(current_user)
    user_events_hash = service.get_user_activity(current_user)

    user_events_hash.map do |user_event_hash|
      Activity.new(user_event_hash)
    end
  end

end
