class User < ApplicationRecord
	has_many :interfaces
	def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.email = auth.info.email
			user.uid = auth.uid
			user.provider = auth.provider
			user.picture = auth.info.image
			user.save!
		end
	end

end
