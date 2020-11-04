class TasksController < ApplicationController
    #インスタンス変数を経由することで、ControllerからViewへ変数を渡すことができる。
    def index
        @tasks = Task.all
    end
    def show
        @task = Task.find(params[:id])
    end
    def new
        @task = Task.new #新規のユーザを作成している
    end
    def create
        @task = Task.new(task_params)
        if @task.save
            flash[:success] = 'タスクが正常に登録されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクの登録に失敗しました'
            render :new
        end
    end
    def edit
        @task = Task.find(params[:id]) #既存のユーザを参照している
    end
    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            flash[:success] = 'タスクが正常に更新されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクの更新に失敗しました'
            render :edit
        end
    end
    def destroy
        @task = Task.find(params[:id])
        @task.destroy

        flash[:success] = 'タスクは正常に削除されました'
        redirect_to tasks_url
        
    end


    private
    #Strong Parameter
    def task_params 
        params.require(:task).permit(:content)
    end
end

