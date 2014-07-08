OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '1434599726817174', 'bd40cae5e6a197f096627e527575c47b'
end