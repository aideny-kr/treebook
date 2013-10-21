module ApplicationHelper
	def flash_class(type)
		case type
			when type = :alert
				"alert-info"
			when type = :notice
				"alert-success"
			else
				""
		end

	end
end
