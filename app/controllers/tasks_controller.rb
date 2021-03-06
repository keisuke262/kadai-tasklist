class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    #インスタンス変数を経由することで、ControllerからViewへ変数を渡すことができる。
    def index
        @tasks = Task.order(id: :desc).page(params[:page]).per(5)
    end
    def show
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
    def edit #既存のユーザを参照している
    end
    def update
        if @task.update(task_params)
            flash[:success] = 'タスクが正常に更新されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクの更新に失敗しました'
            render :edit
        end
    end
    def destroy
        @task.destroy

        flash[:success] = 'タスクは正常に削除されました'
        redirect_to tasks_url
        
    end


    private
    def set_task
        @task = Task.find(params[:id])
    end

    #Strong Parameter
    def task_params 
        params.require(:task).permit(:content, :deadline, :status)
    end


end

