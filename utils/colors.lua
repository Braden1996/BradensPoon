local colors = {}

function colors.fromHex(hex)
  return { hex=hex, alpha=1 }
end

function colors.fromHexAlpha(hex, alpha)
  return pl.tablex.update(colors.fromHex(hex), { alpha=alpha })
end

return colors
