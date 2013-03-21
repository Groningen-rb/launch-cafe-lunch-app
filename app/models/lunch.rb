class Lunch

  attr_accessor :attendee_id
  attr_accessor :date

  def self.url
    "http://lunch/serepo.com/attendees.json"
  end

end
