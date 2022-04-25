class Quote
  include Mongoid::Document
  include Mongoid::Timestamps

  include Turbo::Broadcastable

  field :author, type: String
  field :text, type: String

  validates :author, presence: true
  validates :text, presence: true

  after_create do
    broadcast_prepend_to :quote_list
    send_flash_message({ type: 'success', text: 'Quote created.' })
  end

  after_update do
    broadcast_replace_to :quote_list
    send_flash_message({ type: 'warning', text: 'Quote updated.' })
  end

  after_destroy do
    broadcast_remove_to :quote_list
    send_flash_message({ type: 'danger', text: 'Quote deleted.' })
  end

  private

  def send_flash_message(message)
    broadcast_append_to(:flash_messages,
                        target: :flash_messages,
                        partial: 'layouts/flash_message',
                        locals: { message: message })
  end
end
