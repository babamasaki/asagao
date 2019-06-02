class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
    	t.integer :number, null: false                            #背番号       null: false...空の値が保存されない様にNOT NULL制約が指定されている。
    	t.string :name, null: false                               #ユーザー名    null: false...空の値が保存されない様にNOT NULL制約が指定されている。
    	t.string :full_name                                       #本名
    	t.string :email                                           #メールアドレス
    	t.date :birthday                                          #生年月日
    	t.integer :sex, null: false, default: 1                   #性別 （1:男, 2:女）  default: false...デフォルト値を１に指定
    	t.boolean :administrator, null: false, default: false     #管理者フラグ  defaultをfalseにする事で一般ユーザーがデフォルト値になる。

      t.timestamps
    end
  end
end
