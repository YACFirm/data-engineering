MongoChallenge::Application.routes.draw do
  get "sales/load"
  post "sales/process_file"
end
