# wp_op

A command line Wordpress to Octopress xml conversion tool

## Installation

For the moment the gem isn't published to ruby gems. This means you'll need to 
clone this repo and the run:

```bash
rake install
```

## Usage

So this will convert a wordpress exported xml file to a series of Octopress posts.
At the time it is pretty un-tested other than for my own conversion, so use this at 
your own risk.

To run the conversion:

```bash
wp_op path/to/wordpress.xml output/directory/
```

This will convert the posts found in `path/to/wordpress.xml` into individual 
markdown files and save them into the `output/directory/` folder.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

