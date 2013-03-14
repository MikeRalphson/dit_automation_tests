describe Mobile do

  before(:each) do
    @mobile = Mobile.new
  end

  it "should have Platform as a superclass" do
    @mobile.should be_a_kind_of(Platform)
  end

  #it "should have the Mobile platform in the Mercury request data" do
  #  @mobile.data[:siteInfo][:Platform].should =~ /mobile/i
  #end

  it "should be able to make catchup playlist requests" do
    @mobile = mock(Mobile)
    @mobile.stub!(:mercury_request).and_return('playlist response')

    @mobile.should_receive(:mercury_request).and_return("playlist response")
    response = @mobile.mercury_request
    response.should match('playlist response')
  end

  it 'should allow read-only access to the production identifier' do
    defined?(@mobile.production).should_not be_nil
  end

  it 'should allow read-only access to the expected bitrates' do
    defined?(@mobile.bitrates).should_not be_nil
  end

  it 'should allow read-only access to the expected base url' do
    defined?(@mobile.base_url).should_not be_nil
  end

  it "should have expected bitrates of 400000" do
    @mobile.bitrates.should match_array [400000]
  end

end
