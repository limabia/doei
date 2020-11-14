class FeedbacksController < ApplicationController
    skip_before_action :authorized  
    skip_before_action :verify_authenticity_token
    def index  
        @feedback = Feedback.order :nome
    end
    def new
        @feedback = Feedback.new  
    end    
    def create
        @feedback = Feedback.new(feedback_params) 
        @feedback.increment(:curtiu)  
        if @feedback.save
            redirect_to @feedback
        else
            render 'new'
        end                        
    end
    def curtir
        @feedback = Feedback.find(params[:id])

        if(@feedback.curtiu == nil)            
            @feedback.increment!(:curtiu)
        else
            @feedback.increment(:curtiu)            
        end
           
        @feedback.save

        redirect_to @feedback
    end
    def avaliacoes
        @feedback = Feedback.all
    end
    def show
        @feedback = Feedback.find(params[:id])
    end
    private
    def feedback_params
      params.require(:feedback).permit(:nome, :tipo, :descricao)
    end    
end