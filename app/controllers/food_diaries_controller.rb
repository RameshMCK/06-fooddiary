class FoodDiariesController < ApplicationController

   
     def index
         
      #binding.pry
      @food_diary = FoodDiary.new
       #@food_diaries =  FoodDiary.all
       @food_diaries =  FoodDiary.order(id: :desc)
       
      # binding.pry
      @res= FoodDiary.group(:name)
      servings = FoodDiary.where(:category == 'lunch').group(:category).sum(:no_of_servings)
      cal_per_servings= FoodDiary.where(:category == 'lunch').group(:category).sum(:cal_per_servings)
      @lunch = servings.fetch("lunch").to_i * cal_per_servings.fetch("lunch").to_i
      @dinner = servings.fetch("dinner").to_i * cal_per_servings.fetch("dinner").to_i
      @breakfast = servings.fetch("breakfast").to_i * cal_per_servings.fetch("breakfast").to_i
      
      
       
    end


    def create
            #binding.pry
            t= FoodDiary.new(params[:food_diary].permit(:date_consumed, :name, :category, :no_of_servings, :cal_per_servings))
            t.save
            redirect_to food_diaries_url
    end
    
    def edit
        
        @food_diary = FoodDiary.find(params[:id])
        @food_diaries =  FoodDiary.order(id: :desc)
        render 'index'
    end
    
     def update
        food_diary = FoodDiary.find(params[:id])
        food_diary.update(params[:food_diary].permit(:date_consumed, :name, :category, :no_of_servings, :cal_per_servings))
            redirect_to food_diaries_url

    end
    

 
end
