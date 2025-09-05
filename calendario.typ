#import "@preview/cineca:0.5.0": calendar-month-summary
#import "./util.typ": *

#set document(title: "UnirFísica PER12827", author: "Alberto Corbi")


#let eventos-q1 = (
  ("Bienvenida", color.yellow.transparentize(50%), "2025-09-25", "2025-10-19"),
  ("Docencia Q1", color.aqua.transparentize(50%), "2025-10-20", "2025-10-20"),
  ("", color.white.transparentize(100%), "2025-11-20", "2025-11-20"),
  ("Repaso Q1", color.purple.transparentize(50%), "2025-12-22", "2026-01-04"),
  ("Exámenes Q1", color.red.transparentize(50%), "2026-02-20", "2026-02-22"),
)

#let eventos-q2 = (
  ("Docencia Q2", color.aqua.transparentize(50%), "2026-03-02", "2026-03-02"),
  ("Repaso Q2", color.purple.transparentize(50%), "2026-03-30", "2026-04-04"),
  ("", color.white.transparentize(100%), "2026-05-01", "2026-05-01"),
  ("Exámenes Q2", color.red.transparentize(50%), "2026-06-26", "2026-06-28"),
  ("TFG ordinaria", color.green.transparentize(50%), "2026-07-15", "2026-07-15"),
  ("TFG extraordinaria", color.orange.transparentize(50%), "2026-09-16", "2026-09-16"),
  ("Extraordinaria", color.red.transparentize(50%), "2026-09-04", "2026-09-06"),
)


#let eventos-en-calendario-q1 = ()
#for evento in eventos-q1 {
  eventos-en-calendario-q1.push((secuencia-dias(evento.at(2), evento.at(3), evento.at(1))))
}

#let eventos-en-calendario-q2 = ()
#for evento in eventos-q2 {
  eventos-en-calendario-q2.push((secuencia-dias(evento.at(2), evento.at(3), evento.at(1))))
}

#let azulunir = rgb("#0098cd")
#set page(
  width: auto,
  margin: 0.2cm,
  height: auto,
  fill: gradient.linear(white, rgb("#b1f2eb"), angle: -5deg).sharp(2, smoothness: 20%),
  background: [],
)

#align(center, box(width: 12cm, text(size: 38pt, fill: azulunir, [#context document.title])))
#place(top + left, dx: 0.5cm, dy: 1cm, text(size: 100pt, fill: azulunir.transparentize(70%), rotate(0deg, [Q1])))
#place(top + right, dx: -0.5cm, dy: 1cm, text(size: 100pt, fill: azulunir.transparentize(70%), rotate(0deg, [Q2])))

#v(1cm)
#stack(
  dir: ltr,
  spacing: 1cm,
  calendar-month-summary(
    events: eventos-en-calendario-q1.join(),
    template: (
      month-head: content => strong(date-to-month(content.children.at(0))),
      layout: stack.with(dir: ttb, spacing: 1em),
      day-head: content => text(day-to-letter(content), fill: luma(70%), weight: "extrabold"),
    ),
  ),

  calendar-month-summary(
    events: eventos-en-calendario-q2.join(),
    template: (
      month-head: content => strong(date-to-month(content.children.at(0))),
      layout: stack.with(dir: ttb, spacing: 1em),
      day-head: content => text(day-to-letter(content), fill: luma(70%), weight: "extrabold"),
    ),
  ),
)


#box(width: 12.2cm)[#align(center, [
  #for evento in eventos-q1 + eventos-q2 {
    if evento.at(0).len() == 0 { continue }
    box(box(width: 0.5cm, height: 0.5cm, fill: evento.at(1)) + " " + evento.at(0) + h(0.5cm))
  }
])]

