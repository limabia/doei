class UsuariosController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :reativacao_solicitacao, :reativacao_efetivacao, :recuperar_senha]
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  def new
    @usuario = Usuario.new
  end

  # def create
  #   @usuario = Usuario.create(params.require(:usuario).permit(:apelido,:password))
  #   session[:usuario_id] = @usuario.id
  #   redirect_to '/home'
  # end  

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end


  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create    
  @usuario = Usuario.new(usuario_params)
  respond_to do |format|
    if @usuario.save
      session[:usuario_id] = @usuario.id
      format.html { redirect_to '/home', notice: 'Usuário criado com sucesso. ' }
    else
      format.html { render :new }
      format.json { render json: @usuario.errors, status: :unprocessable_entity }
    end
     end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.ativo = false
    @usuario.save(validate: false)
    session.delete(:usuario_id)
    @current_user = nil
    respond_to do |format|
      format.html { redirect_to '/home'}
      format.json { head :no_content }
    end
  end

  def adicionar_admin
    @usuario = Usuario.find(params[:id])
    @usuario.admin = true;
    @usuario.save(validate: false)
    redirect_to '/usuarios'
  end  

  def remover_admin
    @usuario = Usuario.find(params[:id])
    @usuario.admin = false;
    @usuario.save(validate: false)
    redirect_to '/usuarios'
  end 

  def recuperar_senha     
    if request.post?       
      if params[:email].blank?    
        respond_to do |format|
          flash[:notice] = "E-mail não informado"
          format.html { redirect_to request.referrer }  
        end                 
      else
        usuario = Usuario.find_by(email: params[:email]) 

        if usuario.present?
          usuario.gerar_token 
          # Envio de e-mail
          respond_to do |format|
            flash[:success] = "Solicitação enviada com sucesso"
            format.html { redirect_to request.referrer }  
          end 
        else
          respond_to do |format|
            flash[:notice] = "E-mail não cadastrado"
            format.html { redirect_to request.referrer }  
          end     
        end
      end
      
    end
  end 

  def reativacao_solicitacao
  end 

  def reativacao_efetivacao
    @usuario = Usuario.find_by(email: params[:email])
    if @usuario && @usuario.ativo == false 
      @usuarioativo = false
      # reativacao da conta
      @usuario.ativo = true
      @usuario.save(validate: false)
      if @usuario.ativo == true
        @usuarioativo = true
      end
      respond_to do |format|
        format.html { render :reativacao_efetivacao }
      end
    end
 end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:nome, :password, :password_confirmation, :email, :cpf, :dataNascimento, :cep, :telefone, :ativo, :admin)
    end
end
