class CashRegister 
    attr_accessor :discount, :total
  
    def initialize(discount=0)
      @discount = discount 
      @total = 0
      @items = []
      @last_item = [] 
    end 
    
    def apply_discount
      if discount != 0 
        @total -= (@total * (@discount / 100.to_f))
        "After the discount, the total comes to $#{@total.to_i}."
      else 
        "There is no discount to apply."
      end 
    end 
    
    def add_item(title, price, quantity=1)
      @total += price * quantity 
      quantity.times do 
        @items << title 
      end 
      @last_item = price * quantity 
    end 
    
    def items 
      @items 
    end 
    
    def void_last_transaction 
       @items.delete_at(-1)
      self.total = self.total - @last_item
    end 
  end 
  
  list = CashRegister.new(20) 
  list.add_item("eggs", 1.50, 3) 
  list.add_item("skirt steak", 7.99)  
  list.add_item("apple pie", 3.99, 2) 
  list.total 
  list.items 
  list.apply_discount 
  list.void_last_transaction
  list.items 
  list.total 
  list 