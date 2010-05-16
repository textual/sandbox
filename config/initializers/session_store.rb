# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_v1_session',
  :secret      => 'c8360568c1ebb4fed6b31eb9118a86c1834a328997e47faccc3691728cb40a7498291b3810913220834e0f69a34c0f61877d73304af32f6166727bc4c0b15dce'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
