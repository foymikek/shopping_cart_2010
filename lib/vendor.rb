class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item_obj)
    if @inventory[item_obj].nil?
      0
    else
      @inventory[item_obj]
    end
  end

end
