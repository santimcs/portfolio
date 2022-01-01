class Sell < ActiveRecord::Base
 #	attr_accessible :buy_id, :date, :price, :fee, :vat, :net, :profit, :days, :percent, :yearly, :sequence, :chart

 	belongs_to :buy
 	default_scope { order('date DESC') }
 	mount_uploader :chart, ImageUploader  

	validates_presence_of :buy_id 
	validates_numericality_of :price

	before_save :assign_values
	after_save :assign_sequence
	before_destroy :deduct_values

  # Getter
	def amount
    	buy.qty * price
	end

	private
	def assign_values
		self.fee = (self.buy.qty * self.price) * 0.002070
		self.vat = self.fee * 0.07
		self.net = (self.buy.qty * self.price) - self.fee - self.vat
 		self.profit = self.net - self.buy.net
 		self.days = (self.date - self.buy.date).to_i 
 		if self.days == 0
    		self.days = 1
 		end
 		self.percent = (self.profit/self.buy.net)*100
 		self.yearly = self.percent*365/self.days 
 
 		buy = Buy.find(self.buy_id)
		buy.status = 'Sold'
		buy.save
	
	end  

	def assign_sequence
		update_column(:sequence, 1000 - id)
	end

	def deduct_values		
 		buy = Buy.find(self.buy_id)
		buy.status = 'Active'
		buy.save		
	end 
 
end
