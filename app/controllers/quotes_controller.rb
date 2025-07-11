class QuotesController < ApplicationController
	before_action :set_quote, only: [:show, :edit, :update, :destroy]
	before_action -> { sleep 3 }

	def index
		@quotes = Quote.ordered
	end	

	def show
	end	

	def new
		@quote = Quote.new
	end	

	def create
		@quote = Quote.new(quote_params)

		if @quote.save
			respond_to do |format|
				format.html { redirect_to quotes_path, notice: "Quote was successfuly created." }
				format.turbo_stream
			end	
		else
      render :new, status: :unprocessable_entity	 
		end	
	end

	def edit
	end

	def update
		if @quote.update(quote_params)
			redirect_to quotes_path, notice: "Quote was successfuly updated."
		else
			render :edit, status: :unprocessable_entity
		end	
	end	
	
	def destroy
		@quote.destroy
		redirect_to quotes_path, notice: "Quotes was successfully destroyed."
	end

	private

	def set_quote
		@quote = Quote.find(params[:id])
	end	

	def quote_params
		params.require(:quote).permit(:name)
	end	
end
