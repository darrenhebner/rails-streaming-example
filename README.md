### Rails Streaming
With streaming, we are able to give the browser a head start downloading the assets required for our app. We can send down our `Link rel=preload` headers immediately, while our backend queries for data and renders the template.

By sending the `Link rel=preload` headers early, we are able to get the browser working in parallel with the server. This all adds up to a faster load time.

#### Without streaming
We can see that the bundle does not start downloading until the server generates the html and sends it down.
<img width="903" alt="Screen Shot 2020-06-01 at 5 31 35 PM" src="https://user-images.githubusercontent.com/4441303/83456774-533a4500-a42e-11ea-8f8a-519c29839fcd.png">

#### With streaming
We can see that the browser is able to start downloading the bundle while the server is generating html
<img width="575" alt="Screen Shot 2020-06-01 at 5 37 23 PM" src="https://user-images.githubusercontent.com/4441303/83456899-93012c80-a42e-11ea-9328-0986e69a6e7f.png">

### Running this repo
To run this repo, you will need to start the unicorn server:

`unicorn_rails --config-file config/unicorn.development.rb`

The app should be running on `localhost:3000`

If you want to see the react app running, start `checkout-web`.
