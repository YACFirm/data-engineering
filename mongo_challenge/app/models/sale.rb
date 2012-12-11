class Sale
  include MongoMapper::Document

  key :purchaser_name, String
  key :item_description, String
  key :item_price, Float
  key :purchase_count, Integer
  key :merchant_address, String
  key :merchant_name, String
end
