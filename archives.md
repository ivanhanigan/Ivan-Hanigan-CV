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