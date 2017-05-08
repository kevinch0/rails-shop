class Product < ActiveRecord::Base
list = [
    [ "10.5", "orange" ],
    [ "7", "apple" ],
    [ "8", "banana" ],
    [ "20", "pineapple" ],
    [ "25", "pen" ],
    [ "15.5", "mango" ],
    [ "40", "durian" ]
  ]

  list.each do |price, name|
    Product.create( price: price , name: name)
  end
end
