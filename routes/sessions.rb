class LocationSite < Sinatra::Application

	get '/sessions/new' do 
		if params[:redirect]
			@redirect = :profile
		end
		erb :"/sessions/new"
	end

	post '/sessions' do 
		user = User.authenticate(params[:email],params[:password])
		if user
			session[:user_id] = user.id
			if params[:redirect]
				redirect to('/profile')
			else
				redirect to('/')
			end
		else
			flash[:errors] = ["Email or Password incorrect"]
			erb :"/sessions/new"
		end
	end

	delete '/sessions' do 
		session[:user_id] = nil
		redirect to('/')
	end

end