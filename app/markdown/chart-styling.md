# Chart Styling
PureChart makes it incredibly easy to apply custom styles to your charts without the limitations imposed by mainstream charting libraries or the frustrating syntax of CSS. Instead, define specific styles for your chart using JSON or YAML.

## Configuration File
Define styles for any particular chart in a YAML or JSON file. For example, the following YAML file defines some styles for a custom dark mode chart.

### dark.yml
```{yaml}
---
title:
  font: Inter Tight
  weight: 700
  color: "#FFFFFF"
labels:
  font: Inter Tight
  weight: 700
  color: "#FFFFFF"
ticks:
  font: Inter Tight
  weight: 400
  color: "#FFFFFF"
axes:
  style: "2px solid #FFFFFF"
gridlines:
  style: "2px dashed #FFFFFF33"
...
```

This file should be placed in a new directory `app/purechart` and invoked when creating new charts as so -

```{erb}
<%= lollipop_chart @data, @configuration, "dark" %>
```

PureChart will find your configuration file and throw an error if it fails to do so.

## Default Styles
Your custom configuration will always take precedent over PureChart's default styles! If you'd like to see them in detail, visit the PureChart [repository](https://github.com/PureChart/purechart). Here's a sample of what they look like as of now (3/22/23) -

### default.yml
```{yaml}
---
title:
  font: Inter Tight
  weight: 700
  color: "#000000"
labels:
  font: Inter Tight
  weight: 700
  color: "#000000"
ticks:
  font: Inter Tight
  weight: 400
  color: "#000000"
axes:
  style: "2px solid #000000"
gridlines:
  style: "2px dashed #00000033"
...
```