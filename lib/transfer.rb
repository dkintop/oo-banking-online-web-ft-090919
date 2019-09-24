 require 'pry'
class Transfer
  attr_accessor :status, :all
  attr_reader :sender, :receiver, :amount
  @@all = []
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
    @all << self
  end 
  
  def valid? 
    if sender.valid? && receiver.valid?
      true 
    else 
      false
    end
    #binding.pry
  end 
  
  def execute_transaction
    if @status == "pending" && @sender.balance > @amount && @receiver.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      #binding.pry
    else
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    
  end 
  
end
 
