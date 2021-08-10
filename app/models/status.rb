class Status < ApplicationRecord
  belongs_to :board
  has_many :tasks
end
