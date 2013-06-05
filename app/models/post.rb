class Post < ActiveRecord::Base
  belongs_to :category

  before_save :generate_key

  private

  def generate_key
    self.security_key = SecureRandom.random_number(1_000_000) unless self.security_key
  end
end
