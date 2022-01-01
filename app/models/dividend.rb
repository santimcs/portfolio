class Dividend < ApplicationRecord
  belongs_to :stock
  before_save :assign_names
  default_scope { order('year DESC, quarter DESC, name ASC') }

  YEAR = [
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016"]

  QUARTER = [
    "3",
    "2",
    "1",
  	"4"
  ]

  private

  def assign_names
		stock = Stock.find(self.stock_id)
    self.name = stock.name
    
		self.amt = (self.number * self.ppu);
		# self.x_date = self.p_date;

  end
end
