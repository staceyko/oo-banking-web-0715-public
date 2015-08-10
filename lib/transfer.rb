class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  
  require 'pry'
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
require 'pry'
 def both_valid?
    sender.valid? && receiver.valid? ? true : false
    # binding.pry
  end

  def execute_transaction
    unless @status == "complete"
      if @amount > sender.balance
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif sender.balance -= @amount
            receiver.balance += @amount 
            @status = "complete"
      end
  end

  def reverse_transfer
    if @status == "complete" 
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"

    end
  end
end
end