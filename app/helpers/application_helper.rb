module ApplicationHelper
	# 以下の関数をどこのファイルからも扱えるようにできるところ。

	# 引数controllerが、現在のcontrollerに含まれていたらtrueを返す。
	def controller?(controller)
		controller.include?(params[:controller])
	end

	# 引数actionが、現在のactionに含まれていたらtrueを返す。
	def action?(action)
		action.include?(params[:action])
	end
end
