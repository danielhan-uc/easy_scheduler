json.extract! post, :id, :title, :description, :address, :price, :startdate, :enddate, :owner, :phone, :created_at, :updated_at
json.url post_url(post, format: :json)
