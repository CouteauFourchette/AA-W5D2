# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  moderator_id :integer          not null
#  title        :string           not null
#  description  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, presence: true

  belongs_to :moderator,
   class_name: :User,
   primary_key: :id,
   foreign_key: :moderator_id

   has_many :post_subs, inverse_of: :post
   has_many :posts, through: :post_subs

end
