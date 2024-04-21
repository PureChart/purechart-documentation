# Bar Chart
## Introduction
A bar chart represents **categorical** data with rectangular bars. These bars may be horizontal or vertical, but PureChart currently supports only horizontal bar charts.

The length of each bar is proportional to the value it's supposed to represent. The vertical axis of the bar chart lists the discrete categories being represented while the horizontal axis represents the values of said categories in relation to one another.

## Usage
In your view, use the bar chart helper method as so -

```erb
<%= bar_chart @data, @configuration, "custom-style" %>
```

The third optional argument is the name of the theme you wish to use. The data is organized as a hash. Here's an example of some data and an optional configuration -

```rb
@data = [
    {
        name: "PureChart",
        color: "blue",
        value: 0
    },
    {
        name: "Highcharts",
        color: "purple",
        value: 1000
    },
    {
        name: "Chartkick",
        color: "orange",
        value: 2570
    },
]

...

@configuration = {
    axes: {
        horizontal: "Lines of JavaScript",
    },
    corner_radius: "100px"
}
```