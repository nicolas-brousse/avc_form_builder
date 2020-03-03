# Supercharge Rails form helper with ViewComponent POC

This is a try to supercharge [Rails form helpers](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html) with a custom [FormBuilder](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html) and by using components with [`actionview-component` gem](https://github.com/github/actionview-component).

It's been a while that I was looking to use component on form with easy to use. This repository is a try to do it.

## Motivation

I love components and really like Rails form helper. I tried some gems like `simple_form` or `formtastic`, but didn't really feel happy with them.

In some recent project I used components to manage form, but it's quickly a kind of mess.

So here, the idea is to be able to use regular form helper in a view, but also add some more helpers. And have them all contained in components.

## Run application

Clone the project then simply run the following commands in project:

```sh
$ bin/setup
$ bin/rails s
```

Then, o to [`http://localhost:3000`](http://localhost:3000).

## Form example

```erb
<%= form_with(model: post, local: true) do |f| %>
  <%= f.group :title do %>
    <%= f.text_field :title %>
  <% end %>

  <%= f.group :content do %>
    <%= f.text_area :content %>
  <% end %>

  <%= f.group :published_at do %>
    <%= f.datetime_field :published_at %>
  <% end %>

  <%= f.actions do %>
    <%= f.submit %>
  <% end %>
<% end %>
```

[See file](./app/views/posts/_form.html.erb).

## FormBuilder

To be able to supercharge Rails form helper, I used a custom `FormBuilder` to proxy helpers inside components.

See [`lib/form_builder.rb`](./lib/form_builder.rb).

## Components

### `Form::ActionsComponent`

Adds a new helper named `actions`, to add a wrapper for submit button(s).

```erb
<%= f.actions do %>
  <%= f.submit %>
<% end %>
```

### `Form::DatetimeFieldComponent`

Supercharge `datetime_field` Rails form helper.

```erb
<%= f.datetime_field :published_at %>
```

### `Form::DatetimeSelectComponent`

Supercharge `datetime_select` Rails form helper.

```erb
<%= f.datetime_select :published_at %>
```

### `Form::ErrorsFieldComponent`

Adds a new helper named `errors_helper` that print errors for a specific method.

```erb
<%= form_with(model: post, local: true) do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>
  <%= f.errors_helper :title %>
<% end %>
```

### `Form::FieldComponent` (abstraction)

Contain field helpers abstraction to make component DRY.

### `Form::GroupComponent`

Adds a new helper named `group`, to add a input wrapper. It automatically call `label` and `errors_helper` form helpers.

```erb
<%= f.group :title %>
  <%= f.text_field :title %>
<% end %>
```

### `Form::TextAreaComponent`

Supercharge `text_area` Rails form helper.

```erb
<%= f.text_area :content %>
```

### `Form::TextFieldComponent`

Supercharge `text_field` Rails form helper.

```erb
<%= f.text_field :title %>
```

## Kind of ROADMAP

* `Form::FormComponent` to wrap forms?
