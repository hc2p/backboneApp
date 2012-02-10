prototype of an offline usable web app
===============

this is a prototype of a simple architecture for content-heavy web apps with the ability to work offline.
Its based on backbone.js with a dependency on jQuery. This could easily switched with Zepto though. Its written in CoffeScript. 
The project was build by using the glorious [brunch.io](http://brunch.io/) building environment.

The app initializes itself out of one json-file. This json contains all the data for the different pages. Nothing is stored to localStorage or websql/indexedDb, the caching is based on appCache only right now. This is done by a reference to the manifest.php file. It dynamically creates a manifest file used by the browser to cache all files needed.

There is no intelligent update mechanism. The appCache is updated only if there are changes on the files and a refresh is performed. The all files are downloaded again.
Next versions should implement a way to check for and load updates on model-level.