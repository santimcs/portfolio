class Buy < ActiveRecord::Base
  attr_accessible :date, :price, :qty, :status, :stock_id, :kind, :chart
  belongs_to :stock
  default_scope :order => 'date ASC'
  mount_uploader :chart, ImageUploader  
  
	validates_presence_of :stock_id 
	validates_numericality_of :qty, :price
	before_create :assign_values	
	before_update :assign_values
  # Getter
  def amount
		qty * price
  end 
	
	private
	def assign_values
		self.fee = (self.qty * self.price) * 0.002078;
		self.vat = self.fee * 0.07;
		self.net = (self.qty * self.price) + self.fee + self.vat;
		if self.status != 'Sold'
			self.status = 'Active'
		end			
	end  
end
