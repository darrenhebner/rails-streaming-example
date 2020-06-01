class AppController < ApplicationController
  def show
    response.set_header('Link', '<https://checkout-dev.myshopify.io/assets/app.js>;rel=preload;as=script')
    render stream: true
  end
end
