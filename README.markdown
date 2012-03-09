# Retina graphic helper for Compass

This is a quick helper function to make it easier to maintain regular and retina images in web sites/apps.


## How to use
It works on a similar principle to how XCode manages images for iOS development. If you have an image called `icon.png`, first add another image with twice the height and width to the same directory and call it `icon@2x.png`.

Next use the helper mixin provided by this extension:

	@include background-image-retina('icon.png');
	
At its simplest this will generate:

	background-image: url('icon.png?1323184535');
	
But if you also have the `@2x` image it will generate the require CSS (and a wrapping media query) to provide support for the double size graphics as well:

	background-size: 50% auto;
    background-image: url('icon@2x.png?1323184535');

There is also a second helper mixin to inline the images instead of link to them:

	@include inline-background-image-retina('icon.png');
	
Both functions first check for the existence of the `@2x` graphics and won't fall over if they don't exist, it just won't output the retina CSS.

## Install

1.	Move the folder containing this README into your compass directory (rename it to `retina`)

2.	Add the following to your `config.rb`

		retina_ext = File.join(File.dirname(__FILE__), 'retina')
		require File.join(retina_ext, 'lib', 'sass_extensions.rb')
		add_import_path File.join(retina_ext, 'stylesheets')
		
3. 	Import the mixins into your stylesheet

		@import "retina";
	
## License

Code is Copyright &copy; 2012 [Joe Lambert](http://www.joelambert.co.uk) and is licensed under the terms of the [MIT License](http://joelambert.mit-license.org/).