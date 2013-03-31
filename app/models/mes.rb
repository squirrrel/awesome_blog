class Mes < ActiveRecord::Base

  attr_accessible :username, :password

  has_many :blogs, :foreign_key => 'me_id', :class_name => 'Blogs'

  validates :password, :presence => {:message => 'Please specify a password'},
            :format => {:with => /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*_?).{7,15}$/, :message =>
                                                                            'It should contain 7..15 characters and at least one capital letter'}


  validates :username, :presence => {:message => 'Please specify a username'},
            :format => {:with => /^(?=.*[a-z]).{6,10}$/, :message => 'It should contain 6..10 characters'}


  def self.authenticate(creds={}, action)

    web_input = Mes.new
    web_input.username = creds[:username]
    web_input.password = creds[:password]

    @user__found = Mes.find_by_username(creds[:username])
    hashed_pass = Digest::SHA1.hexdigest(creds[:password])

    arr = []
    arr << Mes.count(:conditions => "password = '#{hashed_pass}'")
    arr << Mes.count(:conditions => "username = '#{creds[:username]}'")

    if action == 'Sign in'

      if web_input.valid? && @user__found && hashed_pass == @user__found.password && arr.each { |num| num == 1 }
        true
      else
        web_input.errors[:username] + web_input.errors[:password]
      end

    else

      if web_input.valid? && @user__found == nil && arr.each { |num| num == 0 }
        web_input.password = hashed_pass
        web_input.save
        return true
      else
        return web_input.errors[:username] + web_input.errors[:password]
      end

    end

  end

  def self.current_user
    @user__found.username
  end


end
