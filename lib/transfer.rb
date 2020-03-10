class Transfer
  
  
  attr_accessor :transfer, :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
  	@transfer
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = 'pending'
  end
  
  def valid?
		@sender.valid? && @receiver.valid? ? true: false
  end

	def execute_transaction
    if @status != 'complete' && sender.balance >= @amount && valid?
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
  	if @status == 'complete'
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
  	end
  end
  
end