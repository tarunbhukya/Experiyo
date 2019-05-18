json.extract! user, :id, :name, :created_at, :updated_at, :is_lender, :address, :pincode, :country
                    :state, :city, :about, :profession, :phone
json.url user_url(user, format: :json)
