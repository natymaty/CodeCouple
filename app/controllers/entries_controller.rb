class EntriesController < ApplicationController
	def index
		@entries = Entry.order(date: :desc)
	end
	def show
		@entry = Entry.find(params["id"])
	end
	def create
		entry_params = params["entry"].permit("title", "contents")
		entry = Entry.create(entry_params)
		redirect_to(entry_path(entry))
	end
	def edit
		@entry = Entry.find(params["id"])
	end
	def update
		entry_params = params["entry"].permit("title", "contents")
		entry = Entry.find(params["id"])
		entry.update(entry_params)
		redirect_to(entry_path(entry))
	end
	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		redirect_to(entries_path)
	end
	def datesomething
		@days = (Date.parse(params[:date]) - Date.parse(Time.now.to_s)).to_i
	end

end
