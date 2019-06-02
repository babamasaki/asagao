teble_names = %w(members)            # %w: 配列を作る。配列の要素はスペース区切りで指定する。式の展開はされない。
teble_names.each do |table_name|
	path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")     
	# rails.root: appのルートパスを(users/taro/rails/asagao)を表すオブジェクト。pathnameクラスのオブジェクト。
	# join: joinメソッドにディレクトリ名をいくつも渡せば、[/users/taro/rails/asagao/db/development/members.rb]の様にパスを組み立てれる。

	if File.exist?(path)        #ファイルがあれが実行する。
		puts "Creating #{table_name}..."
		require path
	end
end