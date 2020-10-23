# frozen_string_literal: true

require 'test_helper'

class MovementsControllerTest < ActionDispatch::IntegrationTest
  test 'should get three_days' do
    get movements_three_days_url
    assert_response :success
  end
end
