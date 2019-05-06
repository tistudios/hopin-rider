class ChatsController < ApplicationController

	def index
		@chats = Chat.all
		@chat = Chat.new
	end

	def new
		@chat = Chat.new
	end

	def create
		@chat = Chat.new(chat_params)
		respond_to do |format|
			if @chat.save
				format.html { redirect to @chat, notice: "Message sent. " }
				format.json { render :show, status: :created, location: @chat }
			else
				format.html { render :new }
				format.json { render json: @chat.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def show
	end
	
	private

	def chat_params
		params.require(:chat).permit(:username, :message)
	end

end