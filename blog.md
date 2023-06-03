---
layout: default
name: Blog
---

<h1>Latest Posts</h1>

<ul>
  {% for post in site.posts %}
    <li>
      <h2><a href="https://ivanhanigan.github.io/Ivan-Hanigan-CV{{ post.url }}">{{  post.title }}</a></h2> 
      <!-- <h2><a href="{{ post.url }}">{{  post.title }}</a></h2> -->
      {{ post.excerpt }}
      {{ post.date | date_to_string }}
<P></P>
    </li>
  {% endfor %}
  

</ul>

<h2 class="widget-title">Categories</h2>
<ul>
{% for category in site.categories %}
<li><a href="{{category | first}}">{{category | first}} ({{category | last | size }})</a></li>
{% endfor %}
</ul>
