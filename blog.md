---
layout: default
name: Blog
---

<h2 class="widget-title">Entries grouped by Tags</h2>
<ul>
{% for tag in site.tags %}
<li><a href="/Ivan-Hanigan-CV/tag/{{tag | first}}">{{tag | first}} ({{tag | last | size }})</a></li>
{% endfor %}
<div class="clear"></div>
</ul>


<h1>Latest Posts</h1>

<ul>
  {% for post in site.posts %}
    <li>
      <!-- <h2><a href="https://ivanhanigan.github.io/Ivan-Hanigan-CV{{ post.url }}">{{  post.title }}</a></h2> -->
      <h2><a href="/Ivan-Hanigan-CV{{ post.url }}">{{ post.date | date_to_string }} {{  post.title }}</a></h2> 
      {{ post.excerpt }}
      <a href="/Ivan-Hanigan-CV{{ post.url }}">Read more</a>
<P></P>
    </li>
  {% endfor %}
  

</ul>

