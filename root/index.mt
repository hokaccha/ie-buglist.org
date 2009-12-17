<%= $self->render('inc/header') %>

<div class="main top">

<%= raw_string($stash->{body}) %>

</div>

<%= $self->render('inc/footer') %>
