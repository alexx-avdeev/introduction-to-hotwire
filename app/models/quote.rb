class Quote
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author, type: String
  field :text, type: String

  validates :author, presence: true
  validates :text, presence: true
end
