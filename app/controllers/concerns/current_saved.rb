module CurrentSaved
	private 
	
        def set_saved
            @saved = Saved.find(session[:saved_id])
            rescue ActiveRecord::RecordNotFound
            @saved = Saved.create
            session[:saved_id] = @saved.id
        end
end