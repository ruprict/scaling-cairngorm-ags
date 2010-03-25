# Scaling Cairngorm with ArcGIS Server
__Source code to support my user presentation at the 2010 ESRI Developers Summit__

[Slideshare link to preso](http://slideshare.net/ruprict/scaling-cairngorms-ags)

## Setup
1. Clone (or fork) the repo: git clone git://github.com/ruprict/scaling-cairngorm.git
2. Import Existing Flex Builder project into Flex Builder
3. Modify Flex Compiler settings (i.e., SDK) as needed
	* `-includes asmock.integration.flexunit.ASMockClassRunner`
4. Create a local virtual directory to http://localhost/scaling that points to the bin-debug directory
5. Change Output Path URL on Flex Build Path Properties page to http://localhost/scaling
6. Build and go

## Resources
* [Cairngorm 3 downloads](http://opensource.adobe.com/wiki/display/cairngorm/Cairngorm+Libraries)
* [A survey of Inversion of Control frameworks for Flex](http://www.adobe.com/devnet/flex/articles/ioc_frameworks.html)
* [Parsely](http://www.spicefactory.org/parsely)
* [FlexUnit4](http://opensource.adobe.com/wiki/display/flexunit/FlexUnit)
* [ASMock](http://asmock.sourceforge.net/)
* [Hamcrest](http://github.com/drewbourne/hamcrest-as3)
* [Great article on View Patterns by Paul Williams of Adobe](http://blogs.adobe.com/paulw/archives/2007/09/presentation_pa.html)


