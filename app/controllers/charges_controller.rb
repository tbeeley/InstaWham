class ChargesController < ApplicationController

	def new
		@post = Post.find(params[:post_id])
		render :template => "charges/new"
	end

	def create
		# Amount in cents
		@amount = "40000"

		customer = Stripe::Customer.create(
			:email => 'example@stripe.com',
			:card  => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => @amount,
			:description => 'Rails Stripe customer',
			:currency    => 'usd'
		)

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to charge_path
	end


end
