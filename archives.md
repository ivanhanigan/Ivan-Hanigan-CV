---
layout: default
title: Archives
---

<ul>
  {% for post in site.posts %}
    <li>
      <a href="/Ivan-Hanigan-CV{{ post.url }}">{{ post.date | date_to_string }} {{ post.title }}</a>
    </li>
  {% endfor %}
</ul>



<h2 class="widget-title">Entries list of posts per title (posts are newest to oldest) </h2>
<ul>
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

<!-- <section class="tags"> -->
    {% for tag in tags %}
        <h3 id="{{ tag | cgi_escape }}">{{ tag }}</h3>
        {% for post in site.tags[tag] %}
            {% if post.title != null %}
                <div class="row">
                    <span>
                        <a href="/Ivan-Hanigan-CV{{ post.url }}">{{ post.title }}</a>
                    </span>
                    <span class="post-date archive-date">
                        {{ post.date | date: "%b %-d, %Y" }}
                    </span>
                </div>
            {% endif %}
        {% endfor %}
    {% endfor %}
<!-- </section> -->

</ul>