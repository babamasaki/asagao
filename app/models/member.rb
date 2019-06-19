class Member < ApplicationRecord
	#numberのバリデーション
	validates :number, presence: true,     #presenceをtrueにすることによって空白を禁止する。
		numericality: {
			only_integer: true,            	#整数のみ
			greater_than: 0,				#0より大きい数字、１以上になる
			less_than: 100,					#100より小さい数字、100未満
			allow_blank: true				#2行目に指定しあるpresence: true, との重複を避ける為
		},
			uniqueness: true
	#nameのバリデーション
	validates :name, presence: true,
		format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/, allow_blank: true, message: :invalid_member_name },
		#\Aは文字の先頭、[A-Za-z]: アルファベット一文字, [A-Zs-z9-0]: 任意の長さ(0個以上の)半角英数字、 \z: 文字の終了
		length: { minimum: 2, maximum: 20, allow_blank: true },   #
		uniqueness: { case_sensitive: false }

	#full_nameのバリデーション
	validates :full_name, presence: true, length: { maximum: 20 }  #氏名を空白禁止の最大20文字以下にする。

	#emailのバリデーション
	validates :email, email: { allow_blank: true }
	#emailは空でもいいけど、不正な形式を入れない様にしている。email:オプションはvalidatesメソッドにはなくgemのおかげで使える。
	#email: trueだけだと、空文字が不正な形式だと判断されてしまう。

	class << self  #selfはこのファイルそのものを指す
		def search(query)
			rel = order("number")   # relにorder(ソート順)を指定したnumberを代入
			if query.present?
				rel = rel.where("name LIKE ? OR full_name LIKE ?", "%#{query}%", "%#{query}%")
				#name またはfull_nameカラムを対象にレコードを絞り込む
			end
			rel      #戻り値
		end
	end
end
