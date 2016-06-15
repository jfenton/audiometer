drawBuffer = (width, height, context, data) ->
  step = Math.ceil(data.length / width)
  amp = height / 2
  context.fillStyle = "black"
  context.clearRect 0, 0, width, height
  i = 0

  while i < width
    min = 1.0
    max = -1.0
    j = 0
    while j < step
      datum = data[(i * step) + j]
      min = datum  if datum < min
      max = datum  if datum > max
      j++
    context.fillRect i, (1 + min) * amp, 1, Math.max(1, (max - min) * amp)
    i++
  return