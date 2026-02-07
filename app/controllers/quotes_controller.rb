class QuotesController < ApplicationController
	before_action :set_quote, only: [:show, :edit, :update, :destroy]

	def index
		@quote = Quote.all
	end
	
	def new
		@quote = Quote.new
	end
	
	def create
		@quote = Quote.new(quote_params)
		if @quote.save
			redirect_to quotes_path, notice: "Quote created successfully."
		else
			render :new
		end		
	end

	def update
		if @quote.update
			redirect_to quotes_path, notice: "Quote updated successfully."
		else
			render :edit
		end		
	end	

	def show
	end

	def edit
	end

	def destroy
		@quote.destroy
		redirect_to quotes_path, notice: "Quote was successfully destroyed"
	end		

	private

	def set_quote
		@quote = Quote.find(params[:id])
	end

	def quote_params
		params.require(:quote).permit(:name)
	end	
end
