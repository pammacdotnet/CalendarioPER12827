


#import "@preview/showybox:2.0.4": showybox
#set page(width: 11cm, height: auto, margin: 0.25cm)
#let q2text = read("q2.txt")
#let bloques = q2text.split(regex("\n\n"))
#let colores = (blue, red, green, maroon, eastern, orange, navy, purple)

#let showy-bloques = ()
#for bloque in bloques {
  let posición-fin-título = bloque.position(regex("\n"))
  let título-bloque = bloque.slice(0, posición-fin-título)
  let contenido-bloque = list(..(bloque.slice(posición-fin-título + 1)).split(regex("\n")))
  let showy-bloque = showybox(
    title: título-bloque,
    title-style: (color: black, weight: "bold", align: center),
    frame: (
      border-color: colores.last().darken(50%),
      title-color: colores.last().lighten(60%),
      body-color: colores.last().lighten(80%),
    ),
    contenido-bloque,
  )

  showy-bloques.push(showy-bloque)
  let dummy = colores.pop()
}

#let showy-bloques-grid = grid(columns: 2, rows: auto, gutter: .2cm, ..showy-bloques)

#align(center)[
  #text(size: 20pt, [Itinerario potencial de asignaturas empezando en 2Q – Unir Física])
]
#showy-bloques-grid
