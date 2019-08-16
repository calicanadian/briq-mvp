class BriqImportsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "briq_imports_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
