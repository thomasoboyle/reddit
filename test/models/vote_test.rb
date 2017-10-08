# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  score       :integer
#  parent_type :string
#  parent_id   :integer
#  user_id     :integer
#

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
