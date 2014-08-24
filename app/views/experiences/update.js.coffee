$('#experience_<%=@experience.id%>').replaceWith '<%= escape_javascript render(@experience) %>'
$('.experience_form').html ''