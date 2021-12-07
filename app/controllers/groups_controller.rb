class GroupsController < ApplicationController
  before_action :authenticate_user!
  #オーナーだけ編集可に
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    #groupを作成した人（ログイン中のuser）のidをowner_idに代入
    @group.owner_id = current_user.id
    #現在のuserをgroupに参加させる
    @group.users << current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end
  
  def index
    #左側のNew Bookに渡す変数
    @book = Book.new
    @groups = Group.all
    #左側のUser infoに渡す変数
    @user = current_user
  end 
  
  def show
    @group = Group.find(params[:id])
    @book = Book.new
    @user = current_user
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end
  
  #グループ参加
  def join
    #ネスト、子のコントローラでparams[:親_id]で親から情報を取得
    @group = Group.find(params[:group_id])
    #@groupに現在のuserを追加
    @group.users << current_user
    redirect_to groups_path
  end
  
  def destroy
    @group = Group.find(params[:id])
    #グループではなくて、current_userが@groupのusers情報から消される
    @group.users.delete(current_user)
    redirect_to groups_path
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end
  
  def ensure_correct_user
    @group = Group.find(params[:id])
    #グループのオーナー以外は編集ページでなく一覧へ
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
  
end
