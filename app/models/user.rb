class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save :capitalize_name

  # #3
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  # #4
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  # #5
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 254 }

  # #6
  has_secure_password

  def capitalize_name
    split_name = []
    new_name = []
    split_name = self.name.split
    split_name.each do |individual_name|
      new_name << individual_name.capitalize
    end
    self.name = new_name.join(" ")
  end
end
