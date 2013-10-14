class JobOffer
	include DataMapper::Resource

	# property <name>, <type>
	property :id, Serial
	property :title, String
	property :location, String
	property :category, String
	property :description, String
	belongs_to :user
	has n, :consultas

	validates_presence_of :title

	def owner
		user
	end

	def owner=(a_user)
		self.user = a_user
	end

	def self.find_by_owner(user)
		JobOffer.all(:user => user)
	end

	def self.find_by_id(id)
		JobOffer.all(:id => id)
	end

	def getId
		id
	end

end
