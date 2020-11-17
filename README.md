Adds includes method to ActiveRecord instances

## Why is this needed?

Sometimes you don't have access to the code that instantiates a particular `ActiveRecord` instance, so you can't call `includes` on the class or `ActiveRecord::Relation` instance to eager load associations.

For example:

```ruby
# Defines the @post instance variable for us
load_and_authorize_resource

def show
  render @post 
end
```

Normally this isn't a problem, because if you have a single instance, it's not possible to encounter a N+1 query while working with that instance or any of its direct associations. 

```haml
%h1= @post.title  

%ul
  - @post.authors.each do |author|
    %li= author.name
```

The problem occurs with more complex (deeply nested) processing, and you have to crawl over the data of nested has_many associations. 

```haml
%ul
  - @post.authors.each do |author|
    -# Causes a N+1 query problem:
    %li= "#{author.name} (#{author.nicknames.pluck(:value).join(',')})
```

That's when you need `activerecord-instance_includes`:

```ruby
@post.includes(authors: [:nicknames])
```
 
## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-instance_includes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-instance_includes

## Usage

Just call `includes` on ActiveRecord instances in the same way you would normally do so for the ActiveRecord class or `ActiveRecord::Relation` instance.

The `#includes` method returns the ActiveRecord instance itself so you can chain method calls:

```ruby
%ul
  - @post.includes(authors: [:nicknames]).authors.each do |author|
    %li= "#{author.name} (#{author.nicknames.pluck(:value).join(',')})
```
