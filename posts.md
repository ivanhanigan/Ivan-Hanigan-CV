---
layout: default
name: Posts
---

<h2 class="widget-title">Entries by Tags</h2>

Jump to [Latest Posts](#latest-posts)

The image below shows how my research outputs have been tagged using a comprehensive framework for Climate Change and Health Impact Assessment. I also tag each research output using the type of environmental risk factor (e.g. drought, bushfires, heat etc).

![assets/CCHP_framework.png](assets/CCHP_framework.png)

Source: McMichael, A., Berry, H., Butler, C., Capon, A., Dear, K., **Hanigan, I.C.**, Lucas, R. & Strazdins, L. (2008). Assessing the scale and nature of health vulnerability to climate change. Technical report for WHO global consultation on ‘Guiding research to improve health protection from climate change’. World Health Organisation, Geneva. (D. Campbell-Lendrum & R. Bertollini, Eds.).

<ul>
<!-- my first attempt -->
<!--{% for tag in  site.tags   %}
<li><a href="/Ivan-Hanigan-CV/tag/{{tag | first}}">{{tag | first}} ({{tag | last | size }})</a></li>
{% endfor %}
<div class="clear"></div>
</ul>
-->
<!-- Kudos to https://stackoverflow.com/a/54637489 -->
<!-- // create empty array -->
{% assign tags = '' | split: '' %}

<!-- // iterate through tags, get tag name and make into an array, concat arrays -->
{% for tag in site.tags %}
    {% assign tagName = tag | first | split: ' ' %}
    {% assign tags = tags | concat: tagName %}
{% endfor %}

<!-- // sort tags -->
{% assign tags = tags | sort %}
    
<!-- // create list of tags and number of posts with that tag -->
<section>
    <ul>
        {% for tag in tags %}
            {% assign postCount = site.tags[tag] | size %}
            <li>
<!--                <a href="#{{ tag | cgi_escape }}" class="tag">
                    {{ tag }}
                    <span>({{ postCount }})</span>
                </a> -->
                <a href="/Ivan-Hanigan-CV-dark/tag/{{ tag }}">{{ tag }} ({{ postCount }})</a>
            </li>
        {% endfor %}
    </ul>
 </section> 



<h1> <a name="latest-posts"></a>Latest Posts</h1>


<ul>
  {% for post in site.posts %}
    <li>
      <!-- <h2><a href="https://ivanhanigan.github.io/Ivan-Hanigan-CV-dark{{ post.url }}">{{  post.title }}</a></h2> -->
      <h2><a href="/Ivan-Hanigan-CV-dark{{ post.url }}">{{ post.date | date_to_string }}: {{  post.title }}</a></h2> 
      {{ post.excerpt }} 
      <a href="/Ivan-Hanigan-CV-dark{{ post.url }}">Read more</a>
      <p></p>
      tags: <a href="/Ivan-Hanigan-CV-dark/tag/{{ post.tags | first }}">{{ post.tags | first }}</a>
      <a href="/Ivan-Hanigan-CV-dark/tag/{{ post.tags | last }}">{{ post.tags | last }}</a>

<!--      tag: <a href="/Ivan-Hanigan-CV-dark/tag/{{ post.tags }}">{{ post.tags }}</a> -->
<P></P>
    </li>
  {% endfor %}
  

</ul>


