local formvalidation = {}

require('formvalidation.rules')

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function formvalidation:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	
	o.rules = {}
	
	return o
end

function formvalidation:set_rules(field, rules)
	self.rules[field] = rules
end

function formvalidation:validate(form)
	local errors = {}
	for k, v in pairs(self.rules) do
		for idx, func in pairs(v) do
			local ret, err = func(form, k, form[k])
			if ret ~= true then
				errors[k] = err
				break
			end
		end
	end
	if tablelength(errors) > 0 then
		return false, errors
	end
	return true
end

return formvalidation