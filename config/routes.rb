Rails.application.routes.draw do
  root 'admin#request_service'

  resources :photo_sectors
  resources :monitorings
  resources :sensors
  resources :detail_contrats
  resources :representatives do
    end
  resources :companies
  resources :accounts
  resources :acceptances
  resources :budget_documents
  resources :budgets
  resources :document_analyses
  resources :analyses
  resources :calendars
  resources :studies
  resources :generate_contract
  resources :petitions do
    resources :clients
  end


  resources :plants do
    collection do
      get 'live', to: 'plants#live'
    end
  end
  resources :sectors do
    collection do
      get 'report', to: 'sectors#report'
    end
  end
  resources :restrictions

  resources :monitoring
  resources :contracts do
    collection do
      get 'new_detail', to: 'contracts#new_detail'
      post 'create_detail', to: 'contracts#create_detail'
    end
  end
  devise_for :users

  resources :admin, only:[:request_service, :history] do
    collection do
      get 'request_service', to: 'admin#request_service'
      get 'history', to: 'admin#history'
      get 'dashboard', to: 'admin#dashboard'
    end
  end

  # cambio de estado de la solicitud a visto
  put '/petitions/:id/ver', to: 'petitions#ver'
  # cambio de estado del calendario para rechazar o finalizar
  put '/calendars/:id/rechazar', to: 'calendars#rechazar'
  put '/calendars/:id/finalizar', to: 'calendars#finalizar'
  # cambio de estado del presupuesto para enviar, rechazar y aceptar
  put '/budgets/:id/enviar', to: 'budgets#enviar'
  put '/budgets/:id/rechazar', to: 'budgets#rechazar'
  put '/budgets/:id/aceptar', to: 'budgets#aceptar'
  # cambio de estado de aceptaciones para aceptar, o rechazar
  put '/acceptances/:id/aceptar', to: 'acceptances#aceptar'
  put '/acceptances/:id/rechazar', to: 'acceptances#rechazar'
  # cambio de estado de estudios para aceptar o rechazar
  put '/studies/:id/aceptar', to: 'studies#aceptar'
  put '/studies/:id/rechazar', to: 'studies#rechazar'
  # cambio de estado de analisis para aceptar o rechazar
  put '/analyses/:id/aceptar', to: 'analyses#aceptar'
  put '/analyses/:id/rechazar', to: 'analyses#rechazar'


  get '/studies/new/:id', to: 'studies#new'
  get '/calendars/new/:id', to: 'calendars#new'
  get '/analyses/new/:id', to: 'analyses#new'
  get '/budgets/new/:id', to: 'budgets#new'
  get '/acceptances/new/:id', to: 'acceptances#new'
  get '/document_analyses/new/:id', to: 'document_analyses#new'
  get '/budget_documents/new/:id', to: 'budget_documents#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
