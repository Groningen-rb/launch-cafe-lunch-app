class LunchViewController < UIViewController

  def viewDidLoad
    super

    self.view.backgroundColor = '#2988e1'.to_color

    @email = UITextField.alloc.initWithFrame(CGRectMake(0, 80, width, 79))
    @email.placeholder = 'Email'
    @email.tag = 1
    @email.font = UIFont.fontWithName("Avenir Next", size: 40)

    view.addSubview @email
  end

end
