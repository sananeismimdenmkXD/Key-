require 'sinatra'

# Sayfa yüklendiğinde veya 1. soru
get '/' do
  erb :index, locals: { step: 1, error: false }
end

# 1. Soru Kontrolü
post '/step1' do
  answer = params[:answer].to_s.strip.downcase
  if answer == 'siyah/beyaz'
    erb :index, locals: { step: 2, error: false }
  else
    erb :index, locals: { step: 1, error: true }
  end
end

# 2. Soru Kontrolü ve Key'i Verme
post '/step2' do
  answer = params[:answer].to_s.strip.downcase
  if answer == 'yıldız'
    erb :success
  else
    erb :index, locals: { step: 2, error: true }
  end
end
