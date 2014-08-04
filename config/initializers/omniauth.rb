OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '1434599726817174', 'f71ba0e1777f9da8abd2c64659804fa6'
end