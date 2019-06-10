class Member < ApplicationRecord
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
