class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :company_type
  # has_one :company_type
end
