check = (pass) ->
  if (pass.a + pass.b + pass.c + pass.d + pass.e) != 26
    return false
  else if (pass.a + pass.c) != (pass.d + pass.e)
    return false
  else
    for key1, value1 of pass
      for key2, value2 of pass
        if key1 != key2 && value1 == value2
          return true

  return false;

pwd = 
  a: 0
  b: 0
  c: 0
  d: 0
  e: 0

seeds = []

for i in [1..24]
  if 24 % i == 0
    seeds.push [i, 24/i]

for i in seeds
  pwd.a = i[0]
  pwd.b = i[1]
  pwd.d = (i[1]/2)

  remaining = (26 - (pwd.a + pwd.b + pwd.d))
  options = []

  for i in [0..remaining]
    options.push [i, remaining-i]

  for i in options
    pwd.c = i[0]
    pwd.e = i[1]
    
    if check pwd
      console.log pwd