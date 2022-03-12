Rails.application.routes.draw do
  # Only this route is available right now
  namespace 'api' do
    namespace 'v1' do
      resources :disbursements
    end
  end
end
