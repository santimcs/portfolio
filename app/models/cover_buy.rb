class CoverBuy < ActiveRecord::Base
  #	attr_accessible :chart, :date, :days, :fee, :net, :percent, :price, :profit, :sequence, :vat, :yearly, :short_sell_id
  	
  	belongs_to :short_sell
  	default_scope { order('date DESC') }
  	mount_uploader :chart, ImageUploader  
  
	validates_presence_of :short_sell_id 
	validates_numericality_of :price

	before_save :assign_values
	after_save :assign_sequence
	before_destroy :deduct_values

  # Getter
	def amount
    	short_sell.qty * price
	end

	private
	def assign_values
		self.fee = (self.short_sell.qty * self.price) * 0.002070
		self.vat = self.fee * 0.07
		self.net = (self.short_sell.qty * self.price) + self.fee + self.vat
 		self.profit = self.short_sell.net - self.net
 		self.days = (self.date - self.short_sell.date).to_i 
 		if self.days == 0
    		self.days = 1
 		end
 		self.percent = (self.profit/self.net)*100
 		self.yearly = self.percent*365/self.days 
 
 		short_sell = ShortSell.find(self.short_sell_id)
		short_sell.status = 'Bought'
		short_sell.save
	
	end  

	def assign_sequence
		update_column(:sequence, 1000 - id)
	end

	def deduct_values		
 		short_sell = ShortSell.find(self.short_sell_id)
		short_sell.status = 'Active'
		short_sell.save		
	end  

end
