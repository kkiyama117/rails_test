# frozen_string_literal: true

# Asset ob user
class Asset < ApplicationRecord
  belongs_to :user
end
