tokens_file = File.join("#{Rails.root}/config", "tokens.yml")
if File.readable?(tokens_file)
  TOKENS = YAML.load_file(tokens_file)[Rails.env]
else
  binding.pry
  TOKENS = { "foursquare" => { "client_id" => ENV["CLIENT_ID"], "client_secret" => ENV["SECRET_ID"] } } 
end
