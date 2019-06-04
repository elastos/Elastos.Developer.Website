+++
title = "Demo Page"
date = 2019-05-24T21:15:40+02:00
weight = 5
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++

This demo page is for doc contributors to find examples of usable shortcodes.<br>
This page is located at **/content/demo_internal.md**.

### FAQ entries
Use this code 
{{< faqentry question="Why is that?">}}
My answer
{{< /faqentry >}}

### Request for translation 
Use this code when you want to write content NOT in english, and want someone else to translate your content in english. Translators must remove it after translating and integrating.

{{% pleasetranslate %}}
大家好
{{% /pleasetranslate %}}

### Tabs
Use tabs to either:

* Show code snippets for different languages.
* Or for any other kind of content, including markdown.

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
    {{% tab name="Mardown" %}} 
### Title
Text without highlighting
    {{% /tab %}} 
{{< /tabs >}}

<br>

{{< tabs >}} 
    {{< tab name="Kotlin" codelang="kotlin" >}} 
        test.tvTitle.text = this.text
    {{< /tab >}} 
    {{< tab name="Swift" codelang="swift" >}} 
        viewController.delegate = self
    {{< /tab >}} 
    {{< tab name="Trinity" codelang="js" >}} 
        myVar.addEventListener("click", doSomething)
    {{< /tab >}} 
{{< /tabs >}}
 
### Todo box

{{% notice todo %}}
Hello. There is something that needs to be completed here.
{{% /notice%}}

### Note box

{{% notice note %}}
Note for readers. Please keep this in mind.
{{% /notice %}}

### Fix me box
{{< fixme "Here is something broken, fix ASAP." >}}

### Check me box
{{< checkme >}}

### Picture

{{< figure src="/demo_picture.png" >}}