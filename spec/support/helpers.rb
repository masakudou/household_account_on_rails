module Helpers
  def log_in(email, password)
    post login_path, params: { session: attributes_for(email, password) }
  end
end
