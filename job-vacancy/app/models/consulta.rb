class Consulta
	include DataMapper::Resource
	
	# property <name>, <type>
	property :id, Serial
	property :title, String
	property :description, String
	belongs_to :job_offer
	belongs_to :user
	

	validates_presence_of :title
	validates_presence_of :description
	
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

	# def job=(a_job_offer)
	# 	self.job_offer = a_job_offer
	# end

end