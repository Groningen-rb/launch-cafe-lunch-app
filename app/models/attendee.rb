class Attendee
  attr_accessor :emailaddress
  attr_accessor :name
  attr_accessor :pluses
  attr_accessor :lunch_id

  def self.url
    "http://lunch.serepo.com/lunches.json"
  end

end