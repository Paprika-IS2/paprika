class GenerateTokenInUser < ActiveRecord::Migration[5.0]
  def change
      User.all.each do |u|
          u.auth_token = Devise.friendly_token
          u.save!
      end
  end
end
