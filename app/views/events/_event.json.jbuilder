json.extract! event, :id, :token, :user_id, :begins, :ends, :repeats, :repeat_rule, :title, :description, :created_at, :updated_at
json.url event_url(event, format: :json)