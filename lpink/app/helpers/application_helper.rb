module ApplicationHelper
	def avatar_url(participante)  
    
      gravatar_id = Digest::MD5::hexdigest(participante.email).downcase  
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=200"  
  end
end
