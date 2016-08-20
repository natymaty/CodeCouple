class EntriesController < ApplicationController
	http_basic_authenticate_with name: "Klausthezebra", password: "monkeysareannoying", except: [:index, :show]
  def index
		@entries = Entry.order(created_at: :desc)
	end

  def show
		@entry = Entry.find(params[:id])
	end

  def new
    @entry = Entry.new
  end

	def create
		@entry = Entry.new(entry_params)

    if @entry.save
		  redirect_to(entry_path(@entry))
    else
      render 'new'
    end
	end

  def edit
		@entry = Entry.find(params[:id])
	end

  def update
		@entry = Entry.find(params[:id])
    if @entry.update(entry_params)
		  redirect_to(entry_path(@entry))
    else
      render 'edit'
    end
	end

  def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		redirect_to(entries_path)
	end

  private
    def entry_params
      params["entry"].permit("title", "contents", "author", "avatar")
    end

#	def datesomething
#		@days = (Date.parse(params[:date]) - Date.parse(Time.now.to_s)).to_i
#	end

end
