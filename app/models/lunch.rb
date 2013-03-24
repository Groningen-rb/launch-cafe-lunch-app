class Lunch < Base

  PROPERTIES = [:id, :attendee_id, :lunch_time, :created_at, :updated_at]
  PROPERTIES.each do |property|
    attr_accessor property
  end

  def initialize(properties = {})
    properties.each { |key, value|
      if PROPERTIES.member? key.to_sym
        self.send((key.to_s + "=").to_s, value)
      end
    }
  end

  def self.url
    "#{self.base_url}lunches#{self.extension}"
  end

  def self.upcoming(&block)
    BW::HTTP.get(self.url) do |res|
      result = BW::JSON.parse(res.body.to_str)
      lunch_data = result[0]
      if result.length < 1
        block.call(nil)
      else
        lunch = Lunch.new(lunch_data)
        block.call(lunch)
      end
    end
  end

end
