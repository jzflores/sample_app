require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
#SampleApp::Application.config.secret_key_base = 'b1df8287516acb9b25c20913ed1bbc0323866a5d9c3492551733ad5ecc932939c5596e23c1dcb5027002e69cb156fffdc5d11b72b199c490c9c23f0015c1db2b'