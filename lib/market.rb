class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor_obj)
    @vendors << vendor_obj
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item_obj)
    @vendors.find_all do |vendor|
      vendor.inventory.keys.include?(item_obj)
    end
  end

  def total_inventory
    breakdown = Hash.new {|hash, key| hash[key] = {:quantity => 0, :vendors => []}}
    @vendors.each do |vendor|
      vendor.inventory.each do |item_obj, amount_int|
        breakdown[item_obj][:quantity] += amount_int
        breakdown[item_obj][:vendors] << vendor
      end
    end
    breakdown
  end

# An item is overstocked if it is sold by more than 1 vendor AND
# the total quantity is greater than 50.
  def overstocked_items
    overstocked = []
    total_inventory.each do |item_obj, info_hash|
      overstocked << item_obj if (info_hash[:quantity] > 50 && info_hash[:vendors].count > 1)
    end
    overstocked
  end


end
