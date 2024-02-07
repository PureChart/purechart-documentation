# Contribution
So you're interested in contributing to PureChart? Excellent - we're grateful for the help!

## Create Example Project
We recommend creating a simple project to test your work.

> Note that we're using Ruby `3.0.0` and Rails `7.0.8`. If you encounter unexpected errors, try using these versions instead.

First, choose the directory where you will be working and run `rails new metrics` to generate a new Ruby on Rails project. We've called the application "metrics" because one might use our charts for some kind of analytics application, but you may choose whatever name you'd like.

## Clone PureChart
Next, clone the PureChart gem from GitHub in the same directory (not in `/metrics`) as so -

```sh
git clone https://github.com/PureChart/purechart.git
```

## Add PureChart to Project
Let's add the local version of PureChart to the metrics application. Open `metrics/Gemfile` and add the following line somewhere in the file.

#### metrics/Gemfile
```ruby
gem "purechart", path: "../purechart"
```

Move to the `metrics` directory in your terminal and run `bundle install` to install the gem. Finally, run `bin/rails server` and you're ready to go! If you visit `http://127.0.0.1:3001` in your web browser, you'll see the following webpage -

![Rails Default Webpage](./images/other/RailsDefaultWebpage.png)

## Create a Chart
Now that we have a working test project, let's add a new page called "dashboard." Ruby on Rails provides many nice generator commands, and we'll use one of them right now. But first, open `metrics/config/routes.rb`. It should look like this -

#### metrics/config/routes.rb
```ruby
Rails.application.routes.draw do
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
end
```

This contains all the routes our application will handle. Add a new route that will point to our dashboard page -

#### metrics/config/routes.rb
```ruby
Rails.application.routes.draw do
    get "/dashboard", to: "dashboard#index"
    ...
end
```

Finally, run `bin/rails generate controller Articles index --skip-routes` to create a **controller** for the dashboard. Ruby on Rails uses the MVC model, which stands for **M**odel **V**iew **C**ontroller. Long story short, the controller decides what data to collect and what views to render based on a user request. The `--skip-routes` flag at the end is necessary because we've already added the route manually.

> [RAILSG](https://railsg.xyz/) is an awesome website that helps you build Ruby on Rails generator commands. Definitely give it a whirl at some point.

This will create a few new files. We're most interested in...

- The controller (`app/controllers/dashboard_controller.rb`), and
- The view (`app/views/dashboard/index.htmk.erb`).

But before we dive into them, go ahead and visit `http://127.0.0.1:3001/dashboard` - you should see a page that looks like this.

![New Dashboard Page](./images/other/NewDashboardPage.png)

### Add Data
We can't generate a chart without data, can we? Go to `app/controllers/dashboard_controller.rb`. Right now, it just has an empty `index` method.

```ruby
class DashboardController < ApplicationController
    def index
    end
end
```

Let's add some fake data for our chart to display. In reality, this data might come from our database or an external source - it might even be live! After doing this, the controller should look like this.

```ruby
class DashboardController < ApplicationController
    def index
        @data = [
            {
                name: "Burger King",
                color: "#ff7f50",
                value: 1200
            },
            {
                name: "McDonalds",
                color: "#ff4757",
                value: 500
            },
            {
                name: "Green Burrito",
                color: "#2ed573",
                value: 780
            }
        ]

        @configuration = {
            axes: {
                horizontal: "Dollars",
            }
        }
    end
end
```

### Generate Chart
Time for the magic! Go to `app/views/dashboard/index.htmk.erb`. This is the template that will be used when users send a `GET` request to `/dashboard`.

Replace its content with the following -

```erb
<%= lollipop_chart @data, @configuration %>
```

Finally, we can enjoy the results!

![DashboardFinished](./images/other/DashboardFinished.png)