class Participant < ApplicationRecord
  validates :name, :surname, :phone, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :phone, format: { with: /\A\d{10,15}\z/, message: "must be a valid phone number" }
end
