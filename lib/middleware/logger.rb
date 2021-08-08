require 'logger'

class AppLogger

  def initialize(app, **options)
    @app = app
    @logger = Logger.new(options[:logdev] || STDOUT)
  end

  def call(env)
    status, header, body = @app.call(env)
    @logger.info(message_for_log(env, status, header))
    [status, header, body]
  end

  def message_for_log(env, status, header)
    "\n" \
    "Request: #{env["REQUEST_METHOD"]} #{env["REQUEST_PATH"]}\n" \
    "Handler: #{env['simpler.controller'].class}##{env['simpler.action']}\n" \
    "Parameters: #{env['simpler.params']}\n" \
    "Response: #{status} [#{header['Content-Type']}] #{env['simpler.template_path']}\n" \
  end
end
