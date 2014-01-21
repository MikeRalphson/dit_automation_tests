describe Samsungtv do

  before(:each) do
    @samsungtv = Samsungtv.new
    json = eval(File.read('spec/support/samsung_restful_response')).to_json
    @rest_request = PlaylistService::RestRequest.new

    stub_request(:get, "#{@rest_request.uri}/playlist/itv/samsung/#{@rest_request.productionid}").to_return(
        :body => json, :headers => {:content_type => 'application/json'})
  end

  it 'should find the correct production ID from a RESTful playlist request', :http_request do
    @samsungtv.request_rest_playlist('samsung')
    @samsungtv.playlist_rest_response.production_id.should == @rest_request.productionid
  end

end


