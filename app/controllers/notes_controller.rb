class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params["id"])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_param)

    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    
    if @note.update(note_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
    Note.find(params[:id]).destroy
    redirect_to notes_path
  end

  private
    def notes_param
      params.require(:note).permit(:title, :color, :body)
    end

end
