class CommentsController < ApplicationController
  # before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_publication

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment
  end

  # POST /comments or /comments.json
  def create
    parametros = comment_params
    parametros["publication_id"] = @publication.id
    parametros["user_id"] = current_user.id
    @comment = Comment.new(parametros)

    respond_to do |format|
      if @comment.save
        redirect_to publication_path(@publication), notice: "Comment was successfully added."
      else
        render "publications/show", status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    parametros = comment_params
    parametros["publication_id"] = @publication.id
    parametros["user_id"] = current_user.id
    respond_to do |format|
      if @comment.update(parametros)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    puts "ENTRO A DELETEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
    @comment = @publication.comments.find(params[:id])  # Find the comment by ID
    @comment.destroy

    # Redirect back to the publication's show page
    redirect_to @publication, notice: "Comment was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @publication.comments.find(params[:id])  # Find the specific comment
    end

    def set_publication
      @publication = Publication.find(params[:publication_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:description, :publication_id, :user_id)
    end
end
