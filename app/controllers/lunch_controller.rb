class LunchController < UIViewController

  def viewDidLoad
    super

    width = Device.screen.width_for_orientation(Device.orientation)

    self.view.backgroundColor = '#2988e1'.to_color

    @email = UITextField.alloc.initWithFrame(CGRectMake(30, 30, width - 60, 30))
    @email.placeholder = 'Email'
    @email.tag = 1
    @email.font = UIFont.fontWithName("Avenir Next", size: 24)
    @email.backgroundColor = '#ffffff'.to_color
    @email.layer.cornerRadius = 3
    @email.layer.masksToBounds = true
    @email.keyboardType = UIKeyboardTypeEmailAddress

    view.addSubview @email
  end

end
