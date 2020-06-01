### Rails Streaming
This demo shows how we can use rails streaming to preload assets. 

### Issues
I haven't been able to get streaming to work with this repo. The content appears to be arriving all at the same time.

#### Steps I took to test if streaming was working:
- Included `<% sleep 2 %>` inside of a partial
- Started unicorn server
- Ran `curl -i localhost:3000`
- Observed that all content arrived at once after a 2 second delay
- I also saw the same behaviour in the browser
- I did see the `Transfer-Encoding: chunked` header as expected

#### How the app was set up for streaming
- Used unicorn as the dev server with a [config](https://github.com/darrenhebner/rails-streaming-example/blob/master/config/unicorn.development.rb) that includes `tcp_nopush: false, tcp_nodelay: true`
- Started dev server with `unicorn_rails --config-file config/unicorn.development.rb`
- Include `render stream: true` in [my controller](https://github.com/darrenhebner/rails-streaming-example/blob/master/app/controllers/app_controller.rb#L4)

#### Expected outcome
- The [preload header](https://github.com/darrenhebner/rails-streaming-example/blob/master/app/controllers/app_controller.rb#L3) should immediately be sent to the browser, causing the script to start downloading
- The layout should render "Streamed from layout"
- After a 2 second delay (from the sleep), the partial should render
