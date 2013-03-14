describe Dotcom do

  before(:each) do
    @dotcom = Dotcom.new
  end

  it "should have Platform as a superclass" do
    @dotcom.should be_a_kind_of(Platform)
  end

  #it "should have the DotCom platform in the Mercury request data" do
  #  @dotcom.data[:siteInfo][:Platform].should =~ /dotcom/i
  #end

  # not sure about these 2 mocking specs
  it "should be able to make catchup playlist requests" do
    @dotcom = mock(Dotcom)
    @dotcom.stub!(:mercury_request).and_return('playlist response')

    @dotcom.should_receive(:mercury_request).and_return("playlist response")
    response = @dotcom.mercury_request
    response.should match('playlist response')
  end

  it "should be able to make archive playlist requests" do
    @dotcom = mock(Dotcom)
    @dotcom.stub!(:mercury_request).and_return('playlist response')

    @dotcom.should_receive(:mercury_request).and_return("playlist response")
    response = @dotcom.mercury_request
    response.should match('playlist response')
  end

  it "should have the Irdeto Encryption module" do
    @dotcom.class.include?(IrdetoEncryption).should == true
  end

  it 'should allow read-only access to the production identifier' do
    defined?(@dotcom.production).should_not be_nil
  end

  it 'should allow read-only access to the expected bitrates' do
    defined?(@dotcom.bitrates).should_not be_nil
  end

  it 'should allow read-only access to the expected base url' do
    defined?(@dotcom.base_url).should_not be_nil
  end

  it 'should have a base url value of rtmpe' do
    @dotcom.eql? /\Artmpe/
  end

  it 'should return a regular expression for the base url attribute' do
    @dotcom.base_url.kind_of? Regexp
  end

  it "should have expected bitrates of 400000, 600000, 800000 and 1200000" do
    @dotcom.bitrates.should match_array [400000, 600000, 800000, 1200000]
  end

end
