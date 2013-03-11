# README

Concatenate is a class that provide a clean way to put all javascript/css files in one file.

## How to use:

1 - Put the .htacces file in the same level of your assets folder.
2 - Create a json file in assets/data/files_manifest.json following the structure bellow:

*Example:*

```json
{
	"css": [
		"reset.css",
		"core.css"
	],
	"js": [
		"lib/jquery.js",
		"core/common.js"
	]

}
```

3 -  After create the file and put all files that you need to load in this json file, you just need to add the javascript and css file to the page, using the structure below:

*Example:*

```html
<link rel="stylesheet" href="assets/css/styles.css">
<script type="text/javascript" src="assets/js/application.js"></script>
```

It will load each file containing all files concatenated and save the loaded version in the correct folder.

4 - To load the generated file just turn RewriteEngine off inside your .htacces file

```htaccess
RewriteRule ^assets/js/(application|application-min)\.js ../vendor/concatenate/jsfiles.php [PT]
RewriteRule ^assets/css/(styles|styles-min)\.css ../vendor/concatenate/cssfiles.php [PT]
```

5 - You can also create different versions of files manifest, following the same structure of files_manifest.json, just adding new lines on htaccess and creating new php files to construct the css and js files.

5.1 - Setup the .htaccess file:

*Example:*

```htaccess
RewriteRule ^assets/js/(my-other-js-file|my-other-js-file-min)\.js ../vendor/concatenate/myother_jsfiles.php [PT]

RewriteRule ^assets/css/(my-other-css-file|my-other-css-file-min)\.css ../vendor/concatenate/myother_cssfiles.php [PT]
```

5.2 - Setup the php files:

*Example:*

myother_jsfiles.php
```php
<?php
header("Content-type: text/javascript");

function autoLoader($class) {
    include $class . '.php';
}

spl_autoload_register('autoLoader');

new Concatenate('js', 'my-other-js-file', '../../www/assets/js/', '../../www/assets/js/', 'myother_jsfiles.json');
?>
```

myother_cssfiles.php
```php
<?php
header("Content-type: text/javascript");

function autoLoader($class) {
    include $class . '.php';
}

spl_autoload_register('autoLoader');

new Concatenate('css', 'my-other-css-file', '../../www/assets/css/', '../../www/assets/css/', 'myother_cssfiles.json');
?>
```

5.3 - Setup the files manifest:

*Example:*

myother_jsfiles.json
```json
{
	"js": [
		"lib/jquery.js",
		"other.js"
	]
}
```

myother_cssfiles.json
```json
{
	"css": [
		"home.css"
	]
}
```

5.4 - Finally, add the files to your html page:

*Example:*

```html
<link rel="stylesheet" href="assets/css/my-other-css-file.css">
<script type="text/javascript" src="assets/js/my-other-js-file.js"></script>
```
