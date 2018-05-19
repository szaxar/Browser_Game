OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '764213219818-6mdil9ifct7aunbtrcdnaad8la0er3qb.apps.googleusercontent.com', '1yUMeVGsuOpstteglyZaF9lX', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end