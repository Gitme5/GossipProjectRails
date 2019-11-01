class User < ApplicationRecord
  
  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 } 

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :description, length: { maximum: 500 }
 

  belongs_to :city
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :sent_messages, foreign_key: 'recipient_id', class_name: "JoinTableMessageRecipient"
  has_many :gossips
end
