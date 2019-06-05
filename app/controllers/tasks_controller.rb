class TasksController < ApplicationController
  def index
      @tasks=Task.all
  end

  def show
      @task=Task.find(params[:id])
  end

  def new
      @task=Task.new
  end

  def create
        @task=Task.new(task_params)
        
        if @task.save
            flash[:success]="保存しました"
            redirect_to @task
        else 
            flash.now[:danger]="保存できませんでした"
            render :new
        end
    end
  
  def edit
      @task=Task.find(params[:id])
  end

  def update
      @task=Task.find(params[:id])
      if @task.update(task_params)
            flash[:success]="更新しました"
            redirect_to @task
        else 
            flash.now[:danger]="更新できませんでした"
            render :new
      end
  end

  def destroy
      @task=Task.find(params[:id])
      @task.destroy
      flash[:success] = 'taskは正常に削除されました'
    redirect_to tasks_url
      
  end

  private

  def task_params
       params.require(:task).permit(:content,:status)
  end
end
