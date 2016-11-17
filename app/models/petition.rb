class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :company_type
  # has_one :company_type

  STATUS = {
    "verifying" => "审核中...",
    "passed" => "审核通过",
    "rejected" => "驳回"
  }
end
