defmodule Service.App do
  use Plug.Router

  require Logger

  plug :match
  plug :dispatch

  get "/" do
    Logger.info "logged by logger..."
    send_resp(conn, 200, HelloModule.say_hello())
  end

  match _ do
    send_resp(conn, 404, "Begone foule demon!")
  end
end
