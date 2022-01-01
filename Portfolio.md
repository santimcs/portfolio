rails g scaffold short_sell stock:references date:date qty:integer
price:decimal fee:decimal vat:decimal net:decimal kind chart status

edit short_sell to modify decimal precision & scale
  t.decimal :price, precision: 6,  scale: 2
  t.decimal :fee,   precision: 7,  scale: 2
  t.decimal :vat,   precision: 6,  scale: 2
  t.decimal :net,   precision: 10, scale: 2

rake db:migrate

modify short_sell model

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
		self.net = (self.qty * self.price) - self.fee - self.vat;
		if self.status != 'Bought'
			self.status = 'Active'
		end			
	end 

rails g scaffold cover_buy short_sell:references date:date 
price:decimal fee:decimal vat:decimal net:decimal days:integer 
profit:decimal percent:decimal 
yearly:decimal sequence:integer chart 

edit short_sell to modify decimal precision & scale
  t.decimal :price, precision: 6,  scale: 2
  t.decimal :fee,   precision: 7,  scale: 2
  t.decimal :vat,   precision: 6,  scale: 2
  t.decimal :net,   precision: 10, scale: 2
  t.decimal :percent,   precision: 9, scale: 5
  t.decimal :yearly,   precision: 9, scale: 5


rake db:migrate

modify cover_buy model

  default_scope :order => 'date DESC'
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
		self.fee = (self.short_sell.qty * self.price) * 0.002078
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