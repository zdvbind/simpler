class TestsController < Simpler::Controller
  def index
    @time = Time.now
    render plain: 'Plain text response'
    status 206
    headers['Content-Type'] = 'text/plain'
  end

  def create; end

  def show
    @test_id = self.params[:id]
  end

end
