class LocationSite < Sinatra::Application

	get '/profile' do 
		if session[:user_id]
			@user = User.first(:id => session[:user_id])
		else
			redirect to('/sessions/new?redirect=profile')
		end
		erb :"/profile/profile"
	end

	get '/profile/favs' do 
		@user = User.first(id: session[:user_id])
		erb :"/profile/fav"
	end

end