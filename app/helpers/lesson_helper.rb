module LessonHelper
	def tiny_format(text)
		h(text).gsub("\n","<br />").html_safe
	end
end
# tiny_formatメソッドは改行をhtmlのbrに変換する。
# hメソッドは＜→ &lt; のようにhtmlを特殊文字を変換する。
# gsubメソッドで改行文字\nから<br/>に一括置換する。
# html_safeメソッドで<br/>をそのまま出力する。