class User < ActiveRecord::Base
  belongs_to :role
  has_one :employee
  has_one :patient
  bad_attribute_names :hash

  attr_accessor :password, :error_message
  before_save :encrypt_password


  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :login
  validates_uniqueness_of :login


  def self.authenticate(name, password)
    user = find_by_login(name)
    if user && user[:hash] == Digest::MD5.hexdigest(user.salt+password).to_s
      user
    else
      nil
    end
  end


  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.attributes = {hash: Digest::MD5.hexdigest(self.salt + password).to_s}
    end
  end

  def generate_password
    self.password = SecureRandom.hex(4)
  end

  def save_first_time
    self.generate_password
    if self.valid?
      self.save
    else
      unless self.errors[:login].empty?
        self.error_message =  ['Данный пользователь уже существует.']
      end
      user = User.find_by(login: self.login)
      user.error_message = self.error_message
      return user
    end
    self
  end

  def self.create_user(human_id, role_name)

    if role_name == 'doctor' || role_name == 'admin'
      human = Employee.find(human_id)
    else
      human = Patient.find(human_id)
    end

    if human
      user = User.new(login: human.indetification_number, role_id: Role.find_by(name: role_name).id)
      user_find = User.find_by(login: human.indetification_number)
      if !user_find
        user = user.save_first_time
      else
        user = user_find
      end

      human.user_id = user.id
      human.save

      user
    end
  end

  def is?(requested_role)
    if self.role
      return self.role.name == requested_role.to_s
    end
    false
  end


end
