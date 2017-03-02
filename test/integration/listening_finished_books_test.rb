require 'test_helper'

class ListeningFinishedBooksTest < ActionDispatch::IntegrationTest

  setup do
    Book.create!(title: 'Finished', finished_at: 1.day.ago)
    Book.create!(title: 'Not Finished', finished_at: nil)

  end
  
  test 'list finished books in JSON' do
    get '/finished_books',params: {}, headers: {'Accept' => 'application/json'}

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type

    assert_equal 1, json(response.body).size
  end
  
  test 'list finished books in XML' do
    get '/finished_books',params: {}, headers: {'Accept' => 'application/xml'}
    assert_equal 200, response.status
    assert_equal Mime[:xml], response.content_type

    assert_equal 1, Hash.from_xml(response.body)['books'].size
  end
  
  
  # test "the truth" do
  #   assert true
  # end
end
