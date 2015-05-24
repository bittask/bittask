Cloudinary.config do |config|
  config.cloud_name = 'bittask'
  config.api_key = ENV['CLOUDINARY_KEY']
  config.api_secret = ENV['CLOUDINARY_SECRET']
  config.cdn_subdomain = true
end