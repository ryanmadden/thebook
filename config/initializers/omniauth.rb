OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '1434599726817174', 'secretkey'
end