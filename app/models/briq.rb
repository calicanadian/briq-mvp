class Briq < ApplicationRecord
  has_many :briq_records, dependent: :destroy
end
