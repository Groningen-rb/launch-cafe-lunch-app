class Base

  def self.protocol
    'http://'
  end

  def self.base_url
    self.protocol + "lunch.serepo.com/"
  end

  def self.extension
    '.json'
  end

end
