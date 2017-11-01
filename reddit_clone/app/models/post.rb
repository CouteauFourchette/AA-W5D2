# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  title      :string           not null
#  url        :string           not null
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :url, presence: true

  include Upvotable

  belongs_to :author,
   class_name: :User,
   primary_key: :id,
   foreign_key: :author_id

   has_many :post_subs, inverse_of: :sub

   has_many :subs, through: :post_subs

   has_many :comments


end
