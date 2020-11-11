class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new {|hash, key| hash[key] = 0}
  end

  def check_stock(item_obj)
    if @inventory[item_obj].nil?
      0
    else
      @inventory[item_obj]
    end
  end

  def stock(item_obj, amount_int)
    @inventory[item_obj] += amount_int
  end

end
