# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
  has_many :items, dependent: :destroy
  validates :email, uniqueness: true
  def assign_default_role
    add_role(:newuser) if roles.blank?
  end
end
