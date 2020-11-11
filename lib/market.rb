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
end
