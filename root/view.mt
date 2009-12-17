<%= $self->render('inc/header') %>

<div class="main view">

<h2><%= $s->{title} %></h2>

<%= raw_string($s->{body}) %>

</div>

<%= $self->render('inc/footer') %>
