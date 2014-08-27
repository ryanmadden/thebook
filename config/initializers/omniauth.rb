OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '1434599726817174', 'f71ba0e1777f9da8abd2c64659804fa6', :image_size => 'large' #, {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
end