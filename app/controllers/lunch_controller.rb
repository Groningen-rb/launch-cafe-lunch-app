class LunchController < UIViewController

  def viewWillAppear(animated)
    super(animated)
    @hello = "text"
  end

  def viewDidLoad
    super

    width = Device.screen.width_for_orientation(Device.orientation)

    self.view.backgroundColor = '#2988e1'.to_color

    #BW::HTTP.get(Lunch.url) do |response|
    #  @lunches = BW::JSON.parse(response.body.to_str)
    #  raise @lunches

    #end

    @label = UILabel.alloc.initWithFrame(CGRectMake(30, 80, width - 60, 30))
    @label.text = @hello
    @label.textColor = '#000000'.to_color

    @email = UITextField.alloc.initWithFrame(CGRectMake(30, 30, width - 60, 30))
    @email.placeholder = 'Email'
    @email.tag = 1
    @email.font = UIFont.fontWithName("Avenir Next", size: 24)
    @email.backgroundColor = '#ffffff'.to_color
    @email.layer.cornerRadius = 3
    @email.layer.masksToBounds = true
    @email.keyboardType = UIKeyboardTypeEmailAddress

    view.addSubview @email
    view.addSubview @label
  end

end
