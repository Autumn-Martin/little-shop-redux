class LittleShopApp < Sinatra::Base
  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  put '/merchants/:id' do
    Merchant.update(params[:id], params[:merchant])
    redirect "/merchants/#{params[:id]}"
  end

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])
    redirect '/merchants'
  end

  get '/items' do
    @items = Item.all
    erb :"items/index"
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :"items/new"
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @merchants = Merchant.all
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  put '/items/:id' do
    Item.update(params[:id], params[:item])
    redirect "/items/#{params[:id]}"
  end

  delete '/items/:id' do
    Item.destroy(params[:id])
    redirect '/items'
  end

  get '/items/dashboard' do
    @items = Item.all
    @average_unit_price = Item.average_unit_price
    @total_item_count = Item.total_item_count
    @newest = Item.newest
    @oldest = Item.oldest
    erb :'items/dashboard'
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :"invoices/index"
  end
end
