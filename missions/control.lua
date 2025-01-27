function test_if_then()
  local result = 'default value'
  if true then
    result = 'true value'
  end
  assert_equal('true value', result)
end

function test_if_then_else()
  local result = 'default value'
  if true then
    result = 'true value'
  else
    result = 'false value'
  end
  assert_equal('true value', result)
end

function test_if_then_elseif_else()
  local result = 'default value'
  if false then
    result = 'first value'
  elseif true then
    result = 'second value'
  else
    result = 'default value'
  end
  assert_equal('second value', result)
end

function test_if_not_statement()
  local result = 'default value'
  if not false then
    result = 'updated value'
  end
  assert_equal('updated value', result)
end

function test_and_or_expression()
  assert_equal( 'true value',  (true and 'true value' or 'false value') )
  assert_equal( 'false value', (false and 'true value' or 'false value') )
end

-- 1 * 1 = 1
-- 1 * 2 = 2
-- 2 * 3 = 6
-- 6 * 4 = 24
-- 24 * 5 = 120
-- 120 * 6 = 720
-- 720 * 7 = 5040
-- 5040 * 8 = 40320
-- 40320 * 9 = 362880
-- 362880 * 10 = 3628800
function test_while()
  local i, result = 1,1
  while i <= 10 do
    result = result * i
    i = i + 1
  end
  assert_equal(3628800, result)
end

function test_break()
  local i, result = 1,1
  while true do
    if i > 10 then break end
    result = result * i
    i = i + 1
  end
  assert_equal(3628800, result)
end

function test_repeat()
  local i, result = 1, 1
  repeat
    result = result * i
    i = i + 1
  until i==11
  assert_equal(3628800, result)
end

function test_numeric_for_creates_a_local_variable_not_available_outside_the_loop()
  local t = { 'fish', 'and', 'chips' }
  local result = {}
  for i=1, #t do
    table.insert(result, t[i])
  end
  assert_equal('fish and chips', table.concat(result, ' '))
  assert_equal(nil, i)
end

function test_numeric_for_with_step()
  local t = { 1,2,3,4,5,6 }
  local result = {}
  for i=2, #t, 2 do -- notice the two here
    table.insert(result, t[i])
  end
  assert_equal('2, 4, 6', table.concat(result, ', '))
end

function test_generic_for_over_array_like_tables_using_ipairs()
   t = { 'fish', 'and', 'chips' }
   result = {}
  for key,value in ipairs(t) do
    table.insert(result, value)
  end
  assert_equal('fish and chips', table.concat(result, ' '))
end

function test_generic_for_over_hash_like_tables_using_pairs()
  local t = { a = 1, b = 2 }
  local result = {}
  for k,v in pairs(t) do
    result[k] = v
  end
  assert_equal(1, result.a)
  assert_equal(2, result.b)
end
