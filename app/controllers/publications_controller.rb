class PublicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_publication, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[new create edit update]

  # GET /publications or /publications.json
  def index
    @publications = Publication.all
  end

  # GET /publications/1 or /publications/1.json
  def show
    @publication = Publication.find(params[:id])
    #This ask if publications has comments and if publication does not have we return nil
    @comments = @publication.comments.any? ? @publication.comments : nil
    @new_comment = @publication.comments.build
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    #array for tag select
    
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications or /publications.json
  def create
    parametros = publication_params
    parametros["user_id"] = current_user.id
    @publication = Publication.new(parametros)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy!

    respond_to do |format|
      format.html { redirect_to publications_path, status: :see_other, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def set_categories
      @categories = Category.all
      @options = []
      @categories.each do |category|
        array =  [category.name, category.id]
        @options << array 
        end
        puts @options
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:title, :description, :category_id, :status, :user_id)
    end
end
