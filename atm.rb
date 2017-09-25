class ATM

	def initialize(sa_balance = 0, ca_balance = 0)
		@sa_balance = sa_balance
		@ca_balance = ca_balance
	end

	def run
		checking_account = Account.new("Checking", @ca_balance)
		savings_account = Account.new("Savings", @sa_balance)

		while true
			puts "---------------------------"
			puts "Welcome to Jonathan's Bank!"
			puts "Here are your options:"
			puts "1. Check Balance"
			puts "2. Deposit Money into Account"
			puts "3. Withdraw Money from Account"
			puts "4. Transfer Between Accounts"
			puts "5. Logout"
			puts "---------------------------"


			choice = gets.chomp

			case choice
			when "1"
				savings_account.show_balance()
				checking_account.show_balance()
			when "2"
				p "Which account would you like to deposit into?"
				p "1. Savings"
				p "2. Checking"
				choice1 = gets.chomp
				p "How much money would you like to deposit?"
				deposit_amount = gets.chomp.to_i
				case choice1
				when "1"
					savings_account.deposit(deposit_amount)
				when "2"
					checking_account.deposit(deposit_amount)
				end
			when "3"
				puts "Which account would you like to withdraw from?"
				puts "1. Savings"
				puts "2. Checking"
				choice2 = gets.chomp
				puts "How much would you like to withdraw?"
				withdraw_amount = gets.chomp.to_i
				case choice2
				when "1"
					savings_account.withdraw(withdraw_amount)
				when "2"
					checking.withdraw(withdraw_amount)
				end
			when "4"
				puts "Which account would you like to transfer out of?"
				puts "1. Savings Account"
				puts "2. Checking Account"
				choice3 = gets.chomp

				puts "How much?"
				trans_amount = gets.chomp.to_i

				case choice3
				when "1"
					savings_account.transfer(checking_account, trans_amount)
				when "2"
					checking_account.transfer(savings_account, trans_amount)
				end

			when "5"
				puts "You've been logged out."
				break
			end
		end

		
	end
end

class Account

	attr_accessor :type, :amount

	def initialize(type, amount)
		@type = type
		@amount = amount
	end

	def show_balance
		puts "Your balance in your #{self.type} account is $ #{self.amount}."
	end

	def deposit(amount)
		self.amount += amount
		puts "Depositing $#{amount} in your account"
		show_balance()
	end

	def withdraw(amount)
		if amount > self.amount
			puts "Insufficent Funds"
			return false
		else
			self.amount -= amount
			puts "Withdrawing $#{amount} from your account"
			show_balance()
			return true
		end
	end

	def transfer(toAccount, amount)
		w = self.withdraw(amount)
		if w
			toAccount.deposit(amount)
		else
			puts "Insufficent funds!"
		end
	end
end


ATM.new.run