defmodule LiveAfWeb.ExampleLive do
  use Phoenix.LiveView
  import Calendar.Strftime

  def render(assigns) do
    ~L"""
    <div>
      <span><%= strftime!(@time, "%r") %></span>
      <a href="#" phx-click="send-msg"><%= @mode %></a>
    <div>
    """
  end

  def mount(_session, socket) do
    if connected?(socket), do: :timer.send_interval(100, self(), :tick)
    {:ok, assign(socket, val: 72, mode: :cooling, time: :calendar.local_time())}
  end

  def handle_info(:tick, socket) do
    {:noreply, assign(socket, time: :calendar.local_time())}
  end

  def handle_event("inc", _, socket) do
    if socket.assigns.val >= 75, do: raise("boom")
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def handle_event("send-msg", _, socket) do
    {:noreply,
     update(socket, :mode, fn
       :cooling -> :heating
       :heating -> :cooling
     end)}
  end
end
