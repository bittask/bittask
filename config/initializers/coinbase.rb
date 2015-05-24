if Rails.env.production?
  COINBASE = Coinbase::Client.new(ENV['COINBASE_API_KEY'], ENV['COINBASE_API_SECRET'])
else
  COINBASE = Coinbase::Client.new("M4jJlwkUfstRyZjA", "rKxEvT2hvI7Ljzmst6DsPCBgFUXAN0xF", options={base_uri: 'https://api.sandbox.coinbase.com/v1'})
  Bitcoin.network = :testnet3
end
