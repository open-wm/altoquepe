json.extract! user, :id, :email, :phone, :name, :balance_in_cents, :date_of_birth, :last_transaction, :created_at, :updated_at
json.url user_url(user, format: :json)
