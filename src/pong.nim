import sdl2

type
  SDLException = object of Exception

  Input {.pure.} = enum none, quit

  Game = ref object
    inputs: array[Input, bool]
    renderer: RendererPtr

template sdlFailIf(cond: typed, reason: string) =
  if cond: raise SDLException.newException(reason & ", SDL error: " & $getError())

proc newGame(renderer: RendererPtr): Game =
  new result
  result.renderer = renderer

proc toInput(key: Scancode): Input =
  case key
  of SDL_SCANCODE_ESCAPE: Input.quit
  else: Input.none

proc handleInput(game: Game) =
  var event = defaultEvent
  while pollEvent(event):
    case event.kind
    of QuitEvent:
      game.inputs[Input.quit] = true
    of KeyDown:
      game.inputs[event.key.keysym.scancode.toInput] = true
    of KeyUp:
      game.inputs[event.key.keysym.scancode.toInput] = false
    else:
      discard

proc render(game: Game) =
  game.renderer.clear()
  game.renderer.present()

proc main =
  sdlFailIf(not sdl2.init(INIT_VIDEO or INIT_TIMER or INIT_EVENTS)):
    "SDL2 could not be initialized"
  defer: sdl2.quit()

  sdlFailIf(not setHint("SDL_RENDER_SCALE_QUALITY", "2")):
    "Linear texture filtering could not be enabled"

  let window = createWindow(
    title = "$1 v$2" % ["Pong", "0.0.1"],
    x = SDL_WINDOWPOS_CENTERED,
    y = SDL_WINDOWPOS_CENTERED,
    w = 1280,
    h = 720,
    flags = SDL_WINDOW_SHOWN
  )
  sdlFailIf(window.isNil):
    "Window could not be created"
  defer: window.destroy()

  let renderer = window.createRenderer(
    index = -1,
    flags = Renderer_Accelerated or Renderer_PresentVsync
  )
  sdlFailIf(renderer.isNil):
    "Renderer could not be created"
  defer: renderer.destroy()

  renderer.setDrawColor(r = 0, g = 0, b = 0)

  var game = newGame(renderer)

  while not game.inputs[Input.quit]:
    game.handleInput()
    game.render()

main()
