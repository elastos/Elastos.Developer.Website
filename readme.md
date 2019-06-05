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

# Folders
* Editable .md files are located in the **content/** folder.<br>
* Website string translations are in **i18n/**.

# Useful shortcodes

**Please check the DEMO PAGE link on the doc website at the bottom of the left panel menu, to view live examples of the following shortcodes.**

Shortcodes are hugo-specific ways to automatically generate html content easily. They can be seen as meta-html. A simple **{{< todo "something" >}}** will generate the html code to display a nice todo box with given content.

Shortcodes can be used in .md and .html files.

### Show an orange TODO box
    {{% notice todo %}}
    Hello. There is something to do
    {{% /notice%}}
    
Or:

    {{%< todo "something to do" >}}

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
    
# CSS Styling
> /static/css/theme-elastos.css

# Custom Javascript
> /static/js/yourscript.js + add to /layouts/partials/custom_footer.html

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
Add the following code to your .md file header:

    tags: ["tutorial", "theme"] 

# Contacts
Make sure to discuss major changes with the following persons first:

| Topic | Contact |
| ----- | ------- |
| Blockchain | Wechat: @于舒楠 (Yu Shunan) |
| Carrier | Wechat: @stiartsly (Tang Zhilong) |
| Hive | Wechat: @stiartsly (Tang Zhilong) |
| Edition | Wechat: @XunDai |

# TODO
1. Import existing data and split where necessary
1. Homepage
1. Check how we can customize text styles in .md in order to underline some words or sentences like on the w3c did spec (colored, very nice to read)
1. Define how to layout/collect/update API references from heterogeneous projects.