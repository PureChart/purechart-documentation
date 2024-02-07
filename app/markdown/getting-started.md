# Getting Started
## Installation
Welcome to the PureChart community. First, add the `purechart` gem to your project by including the following line in your Gemfile.

```shell
gem 'purechart'
```

## Usage
Then, display any of our charts in one of your views by calling a chart helper function and passing your JSON data as an argument.

#### dashboard_controller.rb
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

#### dashboard/index.html.erb
```erb
<div class="card">
    <%= lollipop_chart @data, @axes %>
</div>
```

#### Result
![Lollipop Chart](./images/charts/Lollipop.png)