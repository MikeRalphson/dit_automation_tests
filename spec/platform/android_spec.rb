describe Android do

  before(:each) do
    @android = Android.new
  end

  it 'should have Platform as a superclass' do
    @android.should be_a_kind_of(Platform)
  end

  #it 'should have the Android platform in the Mercury request data' do
  #  @android.data[:siteInfo][:Platform].should =~ /android/i
  #end

  it 'should be able to make catchup playlist requests' do
    @android = mock(Android)
    @android.stub!(:mercury_request).and_return('playlist response')

    @android.should_receive(:mercury_request).and_return('playlist response')
    response = @android.mercury_request
    response.should match('playlist response')
  end

  it 'should allow read-only access to the production identifier' do
    defined?(@android.production).should_not be_nil
  end

  it 'should allow read-only access to the expected bitrates' do
    defined?(@android.bitrates).should_not be_nil
  end

  it 'should allow read-only access to the expected base url' do
    defined?(@android.base_url).should_not be_nil
  end

  it 'should have expected bitrates of 150000, 300000, 400000, 600000, 800000 and 1200000' do
    @android.bitrates.should match_array [150000, 300000, 400000, 600000, 800000, 1200000]
  end

end
