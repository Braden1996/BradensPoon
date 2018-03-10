local mathx = {}

function mathx.sign(v)
  return (v >= 0 and 1) or -1
end

function mathx.round(v, bracket)
  bracket = bracket or 1
  return math.floor((v / bracket) + (mathx.sign(v) * 0.5)) * bracket
end

return mathx
