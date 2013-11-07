local formvalidation = require('formvalidation')

function hello(form, key, value)
	if value ~= 'hello' then
		return false, 'Is not \'hello\''
	end
	return true
end

local validator = formvalidation:new()

validator:set_rules('field1', { rules.required, rules.email })
validator:set_rules('field2', { rules.required, rules.numeric })
validator:set_rules('field3', { hello })

local fields = {
	["field1"] = "test@example.com",
	["field2"] = "1234hello",
	["field3"] = "hello"
}

local fields2 = {
	["field1"] = "test",
	["field2"] = 1234,
	["field3"] = "hello"
}

local fields3 = {
	["field1"] = "test@example.com",
	["field2"] = 1234,
	["field3"] = "helloa"
}

local ret, err = validator:validate(fields)
if not ret then
	-- err is a table of field => error
	print('Errors in form 1:')
	for k,v in pairs(err) do
		print("\t" .. tostring(k) .. ": " .. tostring(v))
	end
end

local ret, err = validator:validate(fields2)
if not ret then
	-- err is a table of field => error
	print('Errors in form 2:')
	for k,v in pairs(err) do
		print("\t" .. tostring(k) .. ": " .. tostring(v))
	end
end

local ret, err = validator:validate(fields3)
if not ret then
	-- err is a table of field => error
	print('Errors in form 3:')
	for k,v in pairs(err) do
		print("\t" .. tostring(k) .. ": " .. tostring(v))
	end
end