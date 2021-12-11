---
title: My Home Page!
---
It's so nice. oooooooooooooh.


{% for post in collections.post reversed %}

<section id="{{ post.data.title slug }}">

<h2><a href="#{{post.data.title slug}}">{{post.data.title}}</a></h2>

{{post.templateContent}}

</section>

{% endfor %}