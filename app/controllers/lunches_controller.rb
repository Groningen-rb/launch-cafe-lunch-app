class LunchesController < UIViewController

  attr_accessor :lunch

  def initWithLunch(lunch)
    initWithNibName(nil, bundle: nil)
    self.lunch = lunch
    self
  end

  def viewDidLoad
    super
    bg_color = '#226cd2'.to_color
    form_bg = '#68a1f0'.to_color
    width = Device.screen.width_for_orientation(Device.orientation)

    # Set view
    self.view.backgroundColor = bg_color
    self.title = "Lunch"

    @label = UILabel.alloc.initWithFrame [[10, 10], [width - 20, 40]]
    @label.text = "NEXT LUNCH IS ON:"
    @label.textColor = '#ffffff'.to_color
    @label.backgroundColor = bg_color

    # Email knop
    @email = UITextField.alloc.initWithFrame [[10, 60], [width - 20, 40]]
    @email.placeholder = "Email address (required)"
    @email.autocapitalizationType = UITextAutocapitalizationTypeNone
    @email.backgroundColor = form_bg
    @email.textColor = '#ffffff'.to_color
    @email.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    @email.leftView = UIView.alloc.initWithFrame([[0, 0], [10, 40]])
    @email.leftViewMode = UITextFieldViewModeAlways
    @email.becomeFirstResponder

    @name = UITextField.alloc.initWithFrame [[10, 110], [width - 100, 40]]
    @name.placeholder = "Name"
    @name.backgroundColor = form_bg
    @name.textColor = '#ffffff'.to_color
    @name.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    @name.leftView = UIView.alloc.initWithFrame([[0, 0], [10, 40]])
    @name.leftViewMode = UITextFieldViewModeAlways

    @plusses = UITextField.alloc.initWithFrame [[@name.frame.size.width + 20, 110], [width - @name.frame.size.width - 30, 40]]
    @plusses.placeholder = "Plus-ones"
    @plusses.backgroundColor = form_bg
    @plusses.textColor = '#ffffff'.to_color
    @plusses.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    @plusses.leftView = UIView.alloc.initWithFrame([[0, 0], [10, 40]])
    @plusses.leftViewMode = UITextFieldViewModeAlways

    # Ik lunch mee knop
    @attend = UIButton.alloc.initWithFrame [[10, 160], [width - 20, 30]]
    @attend.setTitle("ATTEND", forState:UIControlStateNormal)
    @attend.setTitle("WORKING...", forState:UIControlStateDisabled)
    @attend.setBackgroundColor('#e78318'.to_color)

    self.view.addSubview @label
    self.view.addSubview @email
    self.view.addSubview @name
    self.view.addSubview @plusses
    self.view.addSubview @attend

    Lunch.upcoming do |lunch|
      if lunch.nil?
        self.setTitle("None :(", forState: UIControlStateNormal)
      else
        @lunch = lunch
        date_formatter = NSDateFormatter.alloc.init
        date_formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        date = date_formatter.dateFromString @lunch.lunch_time
        @label.text = "NEXT LUNCH IS ON: #{date.strftime('%e %B %H:%m')}"
      end
    end

    @attend.when(UIControlEventTouchUpInside) do
      @attend.enabled   = false
      @email.enabled    = false
      @name.enabled     = false
      @plusses.enabled  = false

      params = { attendee: {} }
      params[:attendee] = { lunch_id: @lunch.id, emailaddress: @email.text, name: @name.text, pluses: @plusses.text }

      Attendee.create(params) do |attendee|
        if attendee.nil?
          App.alert "There was an error putting you on our lunch list. Please try again later."
        else
          App.alert "Awesome! You're gonna lunch with us! Noted..."
        end
        @attend.enabled   = true
        @email.enabled    = true
        @name.enabled     = true
        @plusses.enabled  = true
      end
    end

  end

end
