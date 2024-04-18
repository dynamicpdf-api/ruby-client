require "date"

class InvoiceData
  def initialize
    @Order11077 = Order.new
    @Order11077.OrderID = 11077
    @Order11077.OrderDate = Date.parse("2019-01-06")
    @Order11077.CustomerID = "RATTC"
    @Order11077.ShippedDate = Date.parse("2019-01-30")
    @Order11077.ShipperName = "United Package"
    @Order11077.ShipTo = "Rattlesnake Canyon Grocery\n2817 Milton Dr.\nAlbuquerque, NM 87110\nUSA"
    @Order11077.BillTo = "Rattlesnake Canyon Grocery\n2817 Milton Dr.\nAlbuquerque, NM 87110\nUSA"
    @Order11077.Freight = 8.53
    @Order11077.OrderDetails = [
      OrderDetail.new(2, 24, "Chang", 19),
      OrderDetail.new(3, 4, "Aniseed Syrup", 10),
      OrderDetail.new(4, 1, "Chef Anton's Cajun Seasoning", 22),
      OrderDetail.new(6, 1, "Grandma's Boysenberry Spread", 25),
      OrderDetail.new(7, 1, "Uncle Bob's Organic Dried Pears", 30),
      OrderDetail.new(8, 2, "Northwoods Cranberry Sauce", 40),
      OrderDetail.new(10, 1, "Ikura", 31),
      OrderDetail.new(12, 2, "Queso Manchego La Pastora", 38),
      OrderDetail.new(13, 4, "Konbu", 6),
      OrderDetail.new(14, 1, "Tofu", 23.25),
      OrderDetail.new(16, 2, "Pavlova", 17.45),
      OrderDetail.new(20, 1, "Sir Rodney's Marmalade", 81),
      OrderDetail.new(23, 2, "Tunnbröd", 9),
      OrderDetail.new(32, 1, "Mascarpone Fabioli", 32),
      OrderDetail.new(39, 2, "Chartreuse verte", 18),
      OrderDetail.new(41, 3, "Jack's New England Clam Chowder", 9.65),
      OrderDetail.new(46, 3, "Spegesild", 12),
      OrderDetail.new(52, 2, "Filo Mix", 7),
      OrderDetail.new(55, 2, "Pâté chinois", 24),
      OrderDetail.new(60, 2, "Camembert Pierrot", 34),
      OrderDetail.new(64, 2, "Wimmers gute Semmelknödel", 33.25),
      OrderDetail.new(66, 1, "Louisiana Hot Spiced Okra", 17),
      OrderDetail.new(73, 2, "Röd Kaviar", 15),
      OrderDetail.new(75, 4, "Rhönbräu Klosterbier", 7.75),
      OrderDetail.new(77, 2, "Original Frankfurter grüne Soße", 13),
    ]
  end

  def Order11077
    @Order11077
  end

  def Order11077=(value)
    @Order11077 = value
  end

  def to_json(options = {})
    json_array = Hash.new

    json_array["Order11077"] = @Order11077

    JSON.pretty_generate(json_array)
  end
end

class Order
  def initialize
    @OrderID = nil
    @OrderDate = nil
    @CustomerID = nil
    @ShippedDate = nil
    @ShipperName = nil
    @ShipTo = nil
    @BillTo = nil
    @Freight = nil
    @OrderDetails = nil
  end

  def OrderID
    @OrderID
  end

  def OrderID=(value)
    @OrderID = value
  end

  def OrderDate
    @OrderDate
  end

  def OrderDate=(value)
    @OrderDate = value
  end

  def CustomerID
    @CustomerID
  end

  def CustomerID=(value)
    @CustomerID = value
  end

  def ShippedDate
    @ShippedDate
  end

  def ShippedDate=(value)
    @ShippedDate = value
  end

  def ShipperName
    @ShipperName
  end

  def ShipperName=(value)
    @ShipperName = value
  end

  def ShipTo
    @ShipTo
  end

  def ShipTo=(value)
    @ShipTo = value
  end

  def BillTo
    @BillTo
  end

  def BillTo=(value)
    @BillTo = value
  end

  def Freight
    @Freight
  end

  def Freight=(value)
    @Freight = value
  end

  def OrderDetails
    @OrderDetails
  end

  def OrderDetails=(value)
    @OrderDetails = value
  end

  def to_json(options = {})
    json_array = Hash.new

    json_array["OrderID"] = @OrderID
    json_array["OrderDate"] = @OrderDate
    json_array["CustomerID"] = @CustomerID
    json_array["ShippedDate"] = @ShippedDate
    json_array["ShipperName"] = @ShipperName
    json_array["ShipTo"] = @ShipTo
    json_array["BillTo"] = @BillTo
    json_array["Freight"] = @Freight
    json_array["OrderDetails"] = @OrderDetails

    JSON.pretty_generate(json_array)
  end
end

class OrderDetail
  public

  def initialize(productID, quantity, productName, unitPrice)
    @ProductID = productID
    @Quantity = quantity
    @ProductName = productName
    @UnitPrice = unitPrice
  end

  def ProductID
    @ProductID
  end

  def ProductID=(value)
    @ProductID = value
  end

  def Quantity
    @Quantity
  end

  def Quantity=(value)
    @Quantity = value
  end

  def ProductName
    @ProductName
  end

  def ProductName=(value)
    @ProductName = value
  end

  def UnitPrice
    @UnitPrice
  end

  def UnitPrice=(value)
    @UnitPrice = value
  end

  def to_json(options = {})
    json_array = Hash.new

    json_array["ProductID"] = @ProductID
    json_array["Quantity"] = @Quantity
    json_array["ProductName"] = @ProductName
    json_array["UnitPrice"] = @UnitPrice

    JSON.pretty_generate(json_array)
  end
end
