class TransactionsController < ApplicationController

	# Lista de transactions
	def index
		@users = User.all
		@transactions = Transaction.all
	end

	# Nuevo Altoquepe -> Nuevo envio
	def new
    @transaction = Transaction.new
	end

	def create
		tx_params = transaction_params

		# if amount < 0 # tirar error
		# ubicar usuario por email
		receiver = User.find_by(email: tx_params[:receiver])
		if !receiver.present?
			  redirect_to "/nueva", notice: "no encontramos al usuario con email: X" 
			  return
		end

		# modificar amount: multiplicar por 100 
		amount = tx_params[:amount].to_f * 100

		sender = User.first

		if amount < 0 || amount > sender.balance_in_cents 
			  redirect_to "/nueva", notice: "No tienes fondos mano" 
			  return
		end
		# guardar descripcion
		# guardar la transaccion
		transaction_number = "ABC123"


		@tx = Transaction.create(amount_in_cents: amount, sender: sender, receiver: receiver, transaction_number: transaction_number, description: tx_params[:description])
		if @tx
			sender.balance_in_cents -= amount
			sender.save!
			receiver.balance_in_cents += amount
			receiver.save!

			redirect_to "/", notice: "Todoo ok babmino" 
		else
			redirect_to "/nueva", notice: "Hubo un error guardando la tx" 
		end
	end

	# Cuando enviamos correctamente el yapeo
	def success
	end

	private

	def transaction_params
		params.require(:transaction).permit(:receiver, :amount, :description)
	end
end
