module ApplicationHelper
  def append_flash_stream
    turbo_stream.append :flash_messages, partial: 'layouts/flash_messages'
  end
end
