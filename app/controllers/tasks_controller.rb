class TasksController < ApplicationController
  
    def index
        @tasks = Task.all
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = "Taskが正常に完了されました"
            redirect_to @task
        else
            flash.now[:danger] = "Taskが完了されませんでした"
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @task.update(task_params)
            flash[:success] = "Taskは正常に更新されました"
            redirect_to @task
        else
            flash.now[:danger] = "Taskは更新されませんでした"
            render :edit
        end
    end
    
    def destory
        @task.destroy
        
        flash[:success] = "Taskは正常に削除されました"
        redirect_to tasks_url
    end
    
    private
    
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
      params.require(:task).permit(:content)
    end
end
