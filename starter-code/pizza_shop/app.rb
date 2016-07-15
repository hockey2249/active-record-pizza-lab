class PizzaShop < Sinatra::Base

require 'json'

	# 'GET'
	#This is requiring all the pizzas

	get '/pizza' do
		Pizza.all.to_json

	end

	# 'GET' Pizza's by ID 

	get '/pizza/:id' do 
		Pizza.find(params[:id]).to_json
	end

	#CREATE 

	post '/pizza' do 
		new_pizza = JSON.parse(request.body.read)
		@pizza = Pizza.new(new_pizza)
		@pizza.save
	end  

	#UPDATE

	put '/pizza/:id' do 
		pizza = JSON.parse(request.body.read)
		@updated_pizza = Pizza.find(params[:id])
		@updated_pizza.update_attributes(pizza)

	end


	#DELETE
	# => nothing to convert to json
		#.find 
		#.destroy

	delete '/pizza/:id' do
		@deleted_pizzas = Pizza.find(params[:id])
		@deleted_pizzas.destroy


	end
end




