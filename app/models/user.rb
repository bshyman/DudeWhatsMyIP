class User < ApplicationRecord
	def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.id = auth.uid
			user.email = auth.info.email
			# user.picture = auth.info.image
			user.save!
		end
	end
end
