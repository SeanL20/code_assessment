class UserOrder
	attr_accessor :user_name, :drinks
	
	def initialize(user_name:, users:)
		@user_name = user_name
		@drinks = []
		@users = users

		@users.users << self
	end
end