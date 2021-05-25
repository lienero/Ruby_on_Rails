class HomeController < ApplicationController
    def index
        
    end
    
    def result
        #.to.i : 정수형으로 변환
        @plus_result = params[:num1].to_i + params[:num2].to_i
    end

    def plus
        #.to.i : 정수형으로 변환
        @plus_result = params[:num1].to_i + params[:num2].to_i
    end
end
