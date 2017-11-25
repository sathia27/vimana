Vimana::Application.routes.draw do

  match '/utilize' => 'machine#utilize', via: :get
end
