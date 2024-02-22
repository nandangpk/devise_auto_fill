# Summary

A gem to auto fill 'created_by' or 'updated_by' column in ActiveRecord while using 'devise' gem with no pain

## Table of Content
* [Summary](https://github.com/nandangpk/devise_auto_fill#summary)
* [Table of Content](https://github.com/nandangpk/devise_auto_fill#table-of-content)
* [Project Status](https://github.com/nandangpk/devise_auto_fill#project-status)
* [Installation](https://github.com/nandangpk/devise_auto_fill#installation)
* [How to Use?](https://github.com/nandangpk/devise_auto_fill#how-to-use)

## Project Status
`ONGOING DEVELOPMENT`

## Installation

Add this following code in GemFile
```ruby
gem 'devise_auto_fill', git: 'https://github.com/nandangpk/devise_auto_fill'
```

Gem installation
```
> bundle install
> rails generate devise_auto_fill:install
```

Controller Setup

<sup>app/controllers/application_controller.rb</sup>
```ruby
class ApplicationController < ActionController::Base
  ...
  before_action :set_current_user_id    # add this
  ...
end
```

## How to Use?

#### Auto fill `created_by` and `updated_by` column
<sub>app/models/example.rb</sub>
```ruby
class Example < ApplicationRecord
  devise_auto_fill
  # On create record: auto fill created_by and updated_by column with current_user.id that perform the action
  # On update record: auto fill updated_by column with current_user.id that perform the action
  ...
end
```

OR

<sub>app/models/example.rb</sub>
```ruby
class Example < ApplicationRecord
  devise_auto_fill, :create, :update
  # it perform the same behaviour as 'devise_auto_fill'
  ...
end
```

<hr>

#### Auto fill `created_by` column
<sub>app/models/example.rb</sub>
```ruby
class Example < ApplicationRecord
  devise_auto_fill :create
  # On create record: auto fill created_by and updated_by column with current_user.id that perform the action
  ...
end
```

<hr>

#### Auto fill `updated_by` column
<sub>app/models/example.rb</sub>
```ruby
class Example < ApplicationRecord
  devise_auto_fill :update
  # On update record: auto fill updated_by column with current_user.id that perform the action
  ...
end
