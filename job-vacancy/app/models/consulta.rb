class Consulta
	include DataMapper::Resource
# property <name>, <type>
	property :id, Serial
	property :title, String
	property :description, Text
	belongs_to :user
	#belongs_to :job_offer

	validates_presence_of :title
	
	def owner
		user
	end

	def owner=(a_user)
		self.user = a_user
	end

	def self.find_by_owner(user)
		Consulta.all(:user => user)
	end

	def self.find_by_job_offer(job_offer)
		Consulta.all(:job_offer => job_offer)
	end

	def job_offer=(a_job_offer)
		self.job_offer = a_job_offer
	end

end