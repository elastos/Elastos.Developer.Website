# About
This project is the **Elastos developer website**. Documentation is written using markdown files, and generated as a static website by **Hugo**. You can read [Documentation for Hugo](https://gohugo.io/documentation/) and [Documentation for the Learn Theme](https://learn.netlify.com/en/).

# Setup
Install **Hugo** static website generator from [gohugo.io](https://gohugo.io/getting-started/installing/).

This should be as easy as something similar to:
> brew install hugo (Mac OS)

# Run hugo 
Open a shell in this project folder then run:
> hugo serve --bind=0.0.0.0

*--bind is optional but allows browsing your local website from your mobile device if needed, using your local IP address.*

# Visualize your work
Browse the following location: [http://localhost:1313/](http://localhost:1313/)

# Build for deployment
*This is needed only when publishing a new public version of the website.*

Open a shell in this project folder then run:
> hugo

Generated content is located in **/public**.

# Methodology
* Discuss major folder or content reworks with other team members on wechat or telegram.
* **We don't do multi-languages** as maintaining the whole documentation in several languages with limited resources would lead to bad quality. This documentation is therefore only written in english. A special shortcode must be used by non native english speakers to request help from translators while writting content.
* Everytime you need something custom that is not provided by markdown or by hugo, you probably need to create a new shortcode that will be reusable by more pages (ex: a different kind of "note box").
* Building Elastos projects from source code (not for app developers) should remain documented on github projects. This documentation only provides setup instructions for app developers.

# Content location
> Editable content files are located in the **content/** folder.<br>

# CSS Styling
> /static/css/theme-elastos.css

# Custom Javascript
> /static/js/yourscript.js + add to /layouts/partials/custom_footer.html

# Useful shortcodes

**Please check the DEMO PAGE link on the doc website at the bottom of the left panel menu, to view live examples of the following shortcodes.**

Shortcodes are hugo-specific ways to automatically generate html content easily. They can be seen as meta-html. A simple **{{< todo "something" >}}** will generate the html code to display a nice todo box with given content.

Shortcodes can be used in .md and .html files.

### Generate a simple internal link (secure - will check if page is missing)
	{{< internallink "What is Elastos?" "concepts/what_is_elastos/_index.md" >}} 

### Show an orange TODO box
    {{% notice todo %}}
    Hello. There is something to do
    {{% /notice%}}
    
Or:

    {{< todo "something to do" >}}

### Show a blue NOTE box
    {{% notice note %}}
    Please note
    {{% /notice %}}

### Fix me box
Use this shortcode when you are sure some content HAS to be fixed because you know there is something wrong.

    {{< fixme "Here is something broken, fix ASAP." >}}

### Check me box
Use this shortcode when importing existing content that may be outdated, to make sure someone will finally read the whole content and verify everything is correct.

    {{< checkme >}}

### Tabs for code languages comparison, or any other use

    {{< tabs >}} 
        {{< tab name="Kotlin" codelang="kotlin" >}} 
            holder.tvTitle.text = this.text
        {{< /tab >}} 
        {{< tab name="Swift" codelang="swift" >}} 
            viewController.delegate = self
        {{< /tab >}} 
        {{< tab name="Trinity" codelang="js" >}} 
            myVar.addEventListener("click", doSomething)
        {{< /tab >}} 
        {{< tab name="Mardown" >}} 
    ### Title
    Text without highlighting
        {{< /tab >}} 
    {{< /tabs >}}

### FAQ Entries

    {{% faqentry question="My question?" %}}
    My answer
    {{% /faqentry %}}
    
### Request for translation

    {{% pleasetranslate %}}
    大家好
    {{% /pleasetranslate %}}
    
### Pictures
Store pictures at the same location as their .md file, then use the following shortcode to display them:

	{{< figure src="demo_picture.png" >}}

# Hugo configurations

### To keep a folder always open:
> alwaysopen = true

### To insert a shortcut on the left menu:
Add the following code (one for each language) to config.toml:

    [[Languages.en.menu.shortcuts]] 
    name = "<i class='fas fa-user'></i> DID explorer"
    url = "https://idchain.elastos.org/"
    weight = 20
    
### To add tags at the top of a page:
Add this kind of code to your .md file header:

    tags = ["react native", "api"] 

# About API references
There are 2 ways to write API reference pages in this project:

1. Manually using markdown and shortcodes, for example for REST APIs.
1. By importing sphinx generated documentation as json into pages.

## Embedding sphinx API references

In order to get doxygen-like code documentation built into hugo, please do the following things:

* Use sphinx to generate a json output for your code documentation

> sphinx-build -b json source dest

* Store the generated .fjson file in /data/reference/PLATFORM-OR-LANGUAGE/YOUR_PROJECT and rename it as .json
* From any .md file you can now use the jsonapireference shortcode like this (in case you stored your file in /data/cpp/carrier/carrier-api.json):

        {{< jsonapireference "cpp" "carrier" "carrier-api" >}}
        
* If more styling is required, edit elastos-theme.css
* Recommended: write a script to automatize generation + importation from the root project into this documentation project.

## Embedding complex external html API references
In case it's not possible to smoothly integrate single page documentation using a tool like sphinx (that outputs json), we integrate externally generated docs in iframe the following way:

* Generate your external api reference documentation using javadoc, appledoc, etc.
* Copy the whole content to /static/references/your_folder
* Create a new hugo doc page and add the following information to the hugo header without any other inner content in your .md file:

   		+++
	   	...
   		iframedurl = "/references/your_folder/"
		disableNextPrev = true
		+++
		
## Opening html API references in a new tab
In order to open a link in a new tab when clicking on a left menu item, the following header can be added:

   		+++
	   	...
   		apireferenceexturl = "An_external_url or /references/internal_path_where_doc_is_stored"
		+++

# Contacts
Make sure to discuss major changes with the following persons first:

| Topic | Contact |
| ----- | ------- |
| Blockchain | Wechat: @于舒楠 (Yu Shunan) |
| Carrier | Wechat: @stiartsly (Tang Zhilong) |
| Hive | Wechat: @stiartsly (Tang Zhilong) |
| Edition | Wechat: @XunDai |
| Elastos CLI | Wechat: @BoCheng0000 (BoCheng) |
