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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
