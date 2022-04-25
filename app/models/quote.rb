class Quote
  include Mongoid::Document
  include Mongoid::Timestamps

  include Turbo::Broadcastable

  field :author, type: String
  field :text, type: String

  validates :author, presence: true
  validates :text, presence: true

  after_create { broadcast_prepend_to :quote_list }
  after_update { broadcast_replace_to :quote_list }
  after_destroy { broadcast_remove_to :quote_list }
end
