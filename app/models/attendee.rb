class Attendee < Base

  PROPERTIES = [:lunch_id, :pluses, :name, :emailaddress]
  PROPERTIES.each do |property|
    attr_accessor property
  end

  def initialize(properties = {})
    properties.each do |key, value|
      if PROPERTIES.member? key.to_sym
        self.send((key.to_s + "=").to_s, value)
      end
    end
  end

  def self.url
    self.base_url + 'attendees' + self.extension
  end

  def self.create(params, &block)
    BW::HTTP.post(self.url, { payload: params }) do |res|
      if res.ok?
        result = BW::JSON.parse(res.body.to_str)
        attendee_data = result
        attendee = Attendee.new(attendee_data)
        block.call(attendee)
      else
        App.alert res.error_message
      end
    end
  end
end