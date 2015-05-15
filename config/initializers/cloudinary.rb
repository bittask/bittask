Cloudinary.config do |config|
  config.cloud_name = 'bittask'
  config.api_key = ENV['CLOUDINARY_KEY'] || '476482579145768'
  config.api_secret = ENV['CLOUDINARY_SECRET'] || 'fOvPzYJoj3FgpjhWbfwB16dUAso'
  config.cdn_subdomain = true
end