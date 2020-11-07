class CategoriaController < ApplicationController
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]

  # GET /categoria
  # GET /categoria.json
  def index
    @categoria = Categoria.all
  end

  # GET /categoria/1
  # GET /categoria/1.json
  def show
  end

  # GET /categoria/new
  def new
    @categoria = Categoria.new
  end

  # GET /categoria/1/edit
  def edit
  end

  # POST /categoria
  # POST /categoria.json
  def create
    @categoria = Categoria.new(categoria_params)

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to categoria_path, notice: 'Categoria criada.' }
        format.json { render :show, status: :created, location: @categoria }
      else
        format.html { render :new }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria/1
  # PATCH/PUT /categoria/1.json
  def update
    respond_to do |format|
      if @categoria.update(categoria_params)
        format.html { redirect_to categoria_path, notice: 'Categoria atualizada.' }
        format.json { render :show, status: :ok, location: @categoria }
      else
        format.html { render :edit }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria
      @categoria = Categoria.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categoria_params
      params.require(:categoria).permit(:descricao, :ativo)
    end
end
