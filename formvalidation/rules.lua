module('rules', package.seeall)

function required(form, name, value)
	if not value or value == '' then
		return false, "Must not be empty"
	end
	return true
end

function email(form, name, value)
	if not (value:match("[A-Za-z0-9%.%%%+%-]+@[A-Za-z0-9%.%%%+%-]+%.%w%w%w?%w?")) then
		return false, "Not a valid e-mail address"
	end
	return true
end

function numeric(form, name, value)
	local sType = type(value)
	if sType ~= 'number' then
		return false, "Not numeric"
	end
	return true
end