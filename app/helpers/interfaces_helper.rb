module InterfacesHelper

	def fake_interfaces
		if User.first.interfaces.count < 6
	      	@interfaces = []
	      	6.times do 
	        	@interface = Interface.create!(ip: '192.168.1.1', hostname: 'localhost.com', port: '3000', ddns: 'mysite.me.com', user_id: 1)
	        	@interfaces << @interface
	    	end
		else
			@interfaces = Interface.where(user_id: 1).limit(10)
		end
    	@interfaces
  	end
end