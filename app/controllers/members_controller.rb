class MembersController < ApplicationController
	#  会員一覧
	def index
		@members = Member.order("number")
	end

	# 検索
	def search
		@members = Member.search(params[:q])
		render "index"
	end

	#会員情報の詳細
	def show
		@member = Member.find(params[:id])
	end

	#新規作成フォーム
	def new
		@member = Member.new(birthday: Date.new(1980, 1, 1))
		@member.administrator = true  #管理者のチェックボックスに初期値でチェックを入れておく。
		@member.sex = 2  #女性側にチェックがつく様になる。　ラジオボタンに選択肢が無い場合は初期値でチェックがつく様になる。
	end

	#更新フォーム
	def edit
		@member = Member.find(params[:id])
	end

    #会員の新規登録
	def create
		@member = Member.new(params[:member])
		if @member.save
			redirect_to @member, notice: "会員を登録しました。"    #@memberが表すパスへ飛ぶ
		else
			render "new"
		end
	end

	#会員情報の編集
	def update
		@member = Member.find(params[:id])
		@member.assign_attributes(params[:member])  #assign_attributes: 属性を変更するメソッド
		if @member.save
			redirect_to @member, notice: "会員情報を更新しました。"
		else
			render "edit"
		end
	end

	#会員の削除
	def destroy
		@member = Member.find(params[:id])
		@member.destroy
		redirect_to :members, notice: "会員を削除しました。"
	end
end
