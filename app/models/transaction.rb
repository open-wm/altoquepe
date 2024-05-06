class Transaction < ApplicationRecord
  belongs_to :sender, class_name: "user"
  belongs_to :receiver, class_name: "user"
end
