# frozen_string_literal: true

module Roleable
  extend ActiveSupport::Concern

  included do
    has_many :roles, dependent: :destroy
    has_many :scopes, through: :roles

    accepts_nested_attributes_for :roles
  end

  # NOTE: Is given role present
  def student?
    roles.with_name("student").present?
  end

  def teacher?
    roles.with_name("teacher").present?
  end

  # NOTE: Update roles
  def add_role!(role_name)
    Role.create!(name: role_name, user: self)
  end

  def remove_role!(role_name)
    Role.find_by(name: role_name, user: self).destroy!
  end
end
