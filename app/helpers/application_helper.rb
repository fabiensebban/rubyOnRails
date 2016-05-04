module ApplicationHelper
	def alert_class(name)
		name = name.to_sym
		name = :info unless %i(success info warning danger).include?(name)
		name
	end
end
