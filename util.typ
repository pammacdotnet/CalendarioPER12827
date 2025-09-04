#import "@preview/cineca:0.5.0": day as cinecaday

#let date-to-month(date) = {
  if repr(date).contains("-09-") [Septiembre 2025]
  if repr(date).contains("-10-") [Octubre 2025]
  if repr(date).contains("-11-") [Noviembre 2025]
  if repr(date).contains("-12-") [Diciembre 2025]
  if repr(date).contains("-01-") [Enero 2026]
  if repr(date).contains("-02-") [Febrero 2026]
  if repr(date).contains("-03-") [Marzo 2026]
  if repr(date).contains("-04-") [Abril 2026]
  if repr(date).contains("-05-") [Mayo 2026]
  if repr(date).contains("-06-") [Junio 2026]
  if repr(date).contains("-07-") [Julio 2026]
}

#let day-to-letter(day) = {
  if repr(day).contains("Mon") [L]
  if repr(day).contains("Tue") [M]
  if repr(day).contains("Wed") [X]
  if repr(day).contains("Thu") [J]
  if repr(day).contains("Fri") [V]
  if repr(day).contains("Sat") [S]
  if repr(day).contains("Sun") [D]
}



#let secuencia-dias(finicio-string, ffin-string, color) = {
  let parse-date(s) = toml(bytes("date = " + s)).date
  let finicio = parse-date(finicio-string)
  let ffin = parse-date(ffin-string)
  let time-span = ffin - finicio
  let one-day = duration(days: 1)
  let dias-sequence = ()
  for day in range(0, int(time-span.days()) + 1) {
    let siguiente-dia = finicio + day * one-day
    let siguiente-dia-string = siguiente-dia.display()
    dias-sequence.push((cinecaday(siguiente-dia-string), (rect, (stroke: none, fill: color, inset: 10pt))))
  }
  dias-sequence
}
