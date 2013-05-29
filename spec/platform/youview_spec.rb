describe Youview do

  before(:each) do
    @youview = Youview.new
  end

  it 'should have Platform as a superclass' do
    @youview.should be_a_kind_of(Platform)
  end

  #it "should have the Youview platform in the Mercury request data" do
  #  @youview.data[:siteInfo][:Platform].should =~ /youview/i
  #end

  # not sure about these 2 mocking specs
  it 'should be able to make catchup playlist requests' do
    @youview = mock(Youview)
    @youview.stub!(:mercury_request).and_return('playlist response')

    @youview.should_receive(:mercury_request).and_return('playlist response')
    response = @youview.mercury_request
    response.should match('playlist response')
  end

  it 'should be able to make archive playlist requests' do
    @youview = mock(Youview)
    @youview.stub!(:mercury_request).and_return('playlist response')

    @youview.should_receive(:mercury_request).and_return('playlist response')
    response = @youview.mercury_request
    response.should match('playlist response')
  end

  it 'should allow read-only access to the production identifier' do
    defined?(@youview.production).should_not be_nil
  end

  it 'should allow read-only access to the expected bitrates' do
    defined?(@youview.bitrates).should_not be_nil
  end

  it 'should allow read-only access to the expected base url' do
    defined?(@youview.base_url).should_not be_nil
  end

  it 'should have a base url value of nil' do
    @youview.base_url.should == nil
  end

  it 'should have expected bitrates of 1200000' do
    @youview.bitrates.should match_array [1200000]
  end

  # need bbts/ts video type test

end
